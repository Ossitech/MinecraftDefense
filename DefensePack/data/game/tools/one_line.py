import os

os.chdir(os.path.dirname(os.path.realpath(__file__)))

with open("trader.json") as f:
    text = f.read()

text = text.replace("\n", "")
text = text.replace("\t", "")
text = text.replace("  ", "")

print()
print(text)