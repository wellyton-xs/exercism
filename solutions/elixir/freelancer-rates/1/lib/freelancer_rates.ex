defmodule FreelancerRates do
  defp rate, do: 8.0
  defp billable_days, do: 22
  def daily_rate(hourly_rate) do
    hourly_rate * rate()
  end

  def apply_discount(before_discount, discount) do
    before_discount - (discount / 100 * before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    v = daily_rate(hourly_rate) |> apply_discount(discount)
    v * billable_days() |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    total = monthly_rate(hourly_rate, discount)
    (budget * billable_days()) / total |> Float.floor(1)
  end
end
