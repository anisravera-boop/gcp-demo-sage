from sage.domain.qa.generation import build_prompt
from sage.domain.qa.models import Chunk


def test_prompt_includes_instructions_context_and_question() -> None:
    chunk = Chunk(
        id="1",
        text="Sage è un assistente Q&A.",
        source="sage-overview.md",
        section=None,
        chunk_index=0,
    )
    prompt = build_prompt("Che cos'è Sage?", [chunk], "Rispondi in terzine.")
    assert "Rispondi in terzine." in prompt
    assert "Sage è un assistente Q&A." in prompt
    assert "Che cos'è Sage?" in prompt


def test_prompt_without_instructions_uses_fallback() -> None:
    prompt = build_prompt("Domanda", [], "")
    assert "Nessuna istruzione aggiuntiva." in prompt
    assert "Nessun documento disponibile" in prompt
