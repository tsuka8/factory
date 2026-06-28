import subprocess

cmd = input("コマンドを入力してください: ")
subprocess.run(cmd, shell=True)

print("-------")
