defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      (level == 0) and legacy? != true -> :trace
      (level == 1) -> :debug
      (level == 2) -> :info
      (level == 3) -> :warning
      (level == 4) -> :error
      (level == 5) and legacy? != true -> :fatal
      true -> :unknown
    end
  end
  
  def alert_recipient(level, legacy?) do
    cond do
      LogLevel.to_label(level, legacy?) == :fatal -> :ops
      LogLevel.to_label(level, legacy?) == :error -> :ops
      (LogLevel.to_label(level, legacy?) == :unknown) and legacy? == true -> :dev1
      LogLevel.to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end