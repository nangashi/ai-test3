import pytest
import sys
import os

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "src"))
from main import invoke


@pytest.mark.parametrize(
    "test_payload, expected_in_result",
    [
        ({"prompt": "5と3を足してください"}, "8"),
        ({"prompt": "10.5 + 7.2の計算をお願いします"}, "17.7"),
        (
            {"prompt": "こんにちは！今日はいい天気ですね"},
            None,
        ),  # 計算結果が含まれないことを確認
        ({"prompt": "25と17の合計を教えて"}, "42"),
    ],
)
def test_invoke(test_payload, expected_in_result):
    result = invoke(test_payload)
    assert "result" in result
    if expected_in_result is not None:
        assert expected_in_result in result["result"]
    else:
        # 計算でない場合は数値が返らないことを確認
        assert "合計" not in result["result"] and "足し算" not in result["result"]
