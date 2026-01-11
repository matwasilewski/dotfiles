---
name: refactoring-code
description: Refactors code into cleaner, simpler and more readable structure.
---

This is a code refactoring skill, which covers many edge-cases important when refactoring code

## Error Handling

Don't clutter code with defensive checks; throw exceptions instead. Lean heavily toward Failing Fast via Exceptions rather than "defensive" coding (like returning error codes or checking for flags).

## Prefer Pydantic over Dataclass

In my codebases, unless strongly justified to the contrary, prefer pydantic over dataclasses.

## Avoid Thin Client Wrappers

**Problem**: Thin wrappers around SDK clients add indirection without value.

**Signs of a thin wrapper**:
- Methods that only catch exceptions and re-raise with a different type
- No data transformation (just passes through raw responses)
- No business logic (pagination, retries, caching)
- 1:1 mapping to underlying SDK methods

**When a wrapper IS justified**:
- Converts raw responses to typed models
- Handles pagination or batching
- Implements retry logic with backoff
- Gracefully handles specific error cases (e.g., idempotency)

**Refactoring approach**:
Replace thin wrapper calls with direct SDK usage:

```python
# Before (thin wrapper)
class ApiClient:
    async def get_user(self, id: str) -> dict:
        try:
            return await self._client.users.get(id)
        except ApiError as e:
            raise ClientError(f"Failed: {e}") from e

# After (direct SDK call)
from sdk import AsyncClient, ApiError

response = await client.users.get(user_id)

Keep the wrapper if it does transformation:
# This is NOT a thin wrapper - keep it
async def get_messages(self, channel: str) -> list[Message]:
    response = await self._client.conversations_history(channel=channel)
    return [Message.from_slack_response(m) for m in response["messages"]]