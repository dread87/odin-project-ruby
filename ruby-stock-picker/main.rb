# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
# Example:
# stock_picker([17,3,6,9,15,8,6,1,10]) => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker(prices = [])
  best_days = [0, 1]
  max_profit = prices[1] - prices[0]

  for buy_day in 0..prices.length - 2 do
    for sell_day in (buy_day + 1)..(prices.length - 1) do
      profit = prices[sell_day] - prices[buy_day]

      next unless profit > max_profit

      best_days[0] = buy_day
      best_days[1] = sell_day
      max_profit = profit
    end
  end

  p best_days
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
