"""Thin async wrapper around the Gemini text-generation call."""

from sage.integrations.llm.client import get_genai_client


async def generate_text(prompt: str) -> str:
    client = get_genai_client()
    response = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=prompt,
    )
    return response.text
