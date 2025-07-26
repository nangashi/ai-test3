from strands import tool


@tool
def add_numbers(a: float, b: float) -> float:
    """
    二つの数値を足し算します。

    Args:
        a (float): 最初の数値
        b (float): 二番目の数値

    Returns:
        float: a と b の合計
    """
    result = a + b
    print(f"計算実行: {a} + {b} = {result}")
    return result
