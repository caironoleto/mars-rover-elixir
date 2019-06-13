defmodule MarsRover do
  defstruct [:x, :y, :face]

  def add_rover(x, y, face) do
    %MarsRover{x: x, y: y, face: face}
  end

  def send_command(rover = %MarsRover{}, commands) do
    commands = String.split(commands, ~r{b}, include_captures: true)

    do_send_command(rover, commands)
  end

  defp do_send_command(rover = %MarsRover{}, []), do: rover
  defp do_send_command(%MarsRover{x: x, y: y, face: "N"}, ["L" | next_commands]) do
    %MarsRover{y: y, x: x, face: "W"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "W"}, ["L" | next_commands]) do
    %MarsRover{y: y, x: x, face: "S"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "S"}, ["L" | next_commands]) do
    %MarsRover{y: y, x: x, face: "E"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "E"}, ["L" | next_commands]) do
    %MarsRover{y: y, x: x, face: "N"}
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "W"}, ["R" | next_commands]) do
    %MarsRover{y: y, x: x, face: "N"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "N"}, ["R" | next_commands]) do
    %MarsRover{y: y, x: x, face: "E"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "E"}, ["R" | next_commands]) do
    %MarsRover{y: y, x: x, face: "S"}
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "S"}, ["R" | next_commands]) do
    %MarsRover{y: y, x: x, face: "W"}
    |> do_send_command(next_commands)
  end
end
