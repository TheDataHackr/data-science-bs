import os
import pathlib
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression

full_path = pathlib.Path(__file__).parent.resolve()
df_data = pd.read_csv(os.path.join(full_path, 'data', 'basketball_data.csv'))

na_data = df_data[['AdjEM_Team1']].values - df_data[['AdjEM_Team2']].values

na_labels = df_data['Team1_win'].values

c_logit1 = LogisticRegression(C=1.0)
c_logit2 = LogisticRegression(C=1e-4)

c_logit1.fit(na_data, na_labels)
c_logit2.fit(na_data, na_labels)

na_test = np.atleast_2d(np.linspace(na_data.min(), na_data.max(), 1000)).T

na_test_preds1 = c_logit1.predict_proba(na_test)
na_test_preds2 = c_logit2.predict_proba(na_test)

na_bool = na_labels == 1
na_win = na_data[na_bool]
na_loss = na_data[~na_bool]

plt.title('Logistic Regression - Probability of Team 1 Win')
plt.xlabel('Adjusted Efficiency Metric Difference (courtesy Ken Pomeroy)')
plt.ylabel('Team 1 Win or Loss')
plt.plot(na_win, np.ones(len(na_win)), 'go', alpha=0.1, label='Wins')
plt.plot(na_loss, np.zeros(len(na_loss)), 'ro', alpha=0.1, label='Losses')
plt.plot(na_test, na_test_preds1[:, 1], 'b-', label='Probability of T1 Win [C=1.0]')
plt.plot(na_test, na_test_preds2[:, 1], 'b--', label='Probability of T1 Win [C=1e-4]')
plt.legend()
plt.show()
