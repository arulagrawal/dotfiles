#!/usr/bin/env python3
import requests

rates = requests.get("https://bitpay.com/api/rates").json()
usd = rates[2]["rate"]
zar = rates[166]["rate"]
eth = rates[13]["rate"]

print(f"1 BTC -> {usd} USD -> {zar} ZAR")
print(f"1 ETH -> {usd/eth:.2f} USD -> {zar/eth:.2f} ZAR")
