from statsmodels.tsa.statespace.sarimax import SARIMAX
from statsmodels.tsa.stattools import adfuller
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from sklearn.metrics import mean_absolute_error, mean_squared_error
import pandas as pd

class Predictor:
    def predict(last_months) -> float:
        data = pd.Series([i['sum'] for i in last_months], index=[i['month'] for i in last_months])
        print(data)
        model = SARIMAX(data, order=(1, 1, 1), seasonal_order=(0, 1, 0, 12))
        result = model.fit()
        return result.get_forecast(steps=1).predicted_mean.iloc[0]