from strands import Agent
from strands.models import BedrockModel
from bedrock_agentcore.runtime import BedrockAgentCoreApp
from tools.add_number import add_numbers

# カスタムツールの定義

# Bedrock Claude 4モデルの設定
bedrock_model = BedrockModel(
    model_id="us.anthropic.claude-sonnet-4-20250514-v1:0",  # Claude 4 Sonnet
    region="us-east-1",  # 適切なリージョンを指定
)

# AgentCoreアプリケーションの初期化
app = BedrockAgentCoreApp()

# Strandsエージェントの作成（Claude 4 + 足し算ツール）
agent = Agent(
    model=bedrock_model,
    tools=[add_numbers],
    system_prompt="""
    あなたは親切で正確な数学アシスタントです。
    ユーザーから数値の足し算を求められた場合は、add_numbers ツールを使用して計算してください。
    計算結果は分かりやすく日本語で説明してください。
    """,
)


@app.entrypoint
def invoke(payload):
    """
    ユーザー入力を処理してレスポンスを返す

    Args:
        payload (dict): リクエストペイロード

    Returns:
        dict: エージェントのレスポンス
    """
    try:
        user_message = payload.get("prompt", "No Message")
        print(f"ユーザーメッセージ: {user_message}")

        # エージェントの実行
        result = agent(user_message)

        response = {
            "result": result.message,
        }

        print(f"レスポンス: {response}")
        return response

    except Exception as e:
        print(f"エラーが発生しました: {str(e)}")
        return {
            "error": f"処理中にエラーが発生しました: {str(e)}",
            "result": "申し訳ございませんが、リクエストを処理できませんでした。",
        }


# ローカル実行用のメイン関数
if __name__ == "__main__":
    app.run()
