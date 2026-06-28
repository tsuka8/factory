# ユーザー入力をそのまま eval に渡す危険な例
user_input = input("何か入力してください: ")

# ★危険ポイント：ユーザー入力がそのまま Python コードとして実行される
result = eval(user_input)

print("結果:", result)