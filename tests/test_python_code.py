"""Just one test"""

import uuid


def get_name_len(name: str) -> str:
    """Len var"""
    a=5
    return len(name)


def start():
    "Run ... "
    print(get_name_len("Ricardo"))
    print(uuid.uuid4().hex)
