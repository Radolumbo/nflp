import pandas as pd

#Enter desired years of data
YEARS = [2019]

df = pd.DataFrame()

for i in YEARS:
    #low_memory=False eliminates a warning
    i_data = pd.read_csv('https://github.com/nflverse/nflfastR-data/blob/master/data/' \
                         'play_by_play_' + str(i) + '.csv.gz?raw=True',
                         compression='gzip', low_memory=False)

    #sort=True eliminates a warning and alphabetically sorts columns
    df = df.append(i_data, sort=True)

#Give each row a unique index
df.reset_index(drop=True, inplace=True)

# print("Available columns:")
# print([c for c in df.columns])

#D.Montgomery has player_id 00-0035685

df = df.loc[df['rusher'] == "D.Montgomery"]

print(f"David Montgomery gained {df['yards_gained'].sum()} in 2019.")
