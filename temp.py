import pandas as pd

url = "https://opencompass.openxlab.space/utils/VLMEval/Creation_MMBench.tsv"
df = pd.read_csv(url, sep='\t')

# Take header 2 rows
df_small = df.head(2)

# Save locally
df_small.to_csv("Creation_MMBench_small_1.tsv", sep='\t', index=False)


# from vlmeval.api import OpenAIWrapper
# model = OpenAIWrapper('meta-llama/Llama-3.3-70B-Instruct', verbose=True, use_hyperbolic=True)
# msgs = [dict(type='text', value='Hello!')]
# code, answer, resp = model.generate_inner(msgs)
# print(code, answer, resp)
