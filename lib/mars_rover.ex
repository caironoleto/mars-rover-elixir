defmodule MarsRover do
  defstruct [:x, :y, :face]

  def add_rover(x, y, face) do
    %MarsRover{x: x, y: y, face: face}
  end

  def send_command(rover = %MarsRover{}, commands) do
    commands = String.graphemes(commands)

    do_send_command(rover, commands)
  end

  defp do_send_command(rover = %MarsRover{}, []), do: rover
  defp do_send_command(%MarsRover{x: x, y: y, face: "N"}, ["L" | next_commands]) do
    build_rover(x, y, "W")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "W"}, ["L" | next_commands]) do
    build_rover(x, y, "S")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "S"}, ["L" | next_commands]) do
    build_rover(x, y, "E")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "E"}, ["L" | next_commands]) do
    build_rover(x, y, "N")
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "W"}, ["R" | next_commands]) do
    build_rover(x, y, "N")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "N"}, ["R" | next_commands]) do
    build_rover(x, y, "E")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "E"}, ["R" | next_commands]) do
    build_rover(x, y, "S")
    |> do_send_command(next_commands)
  end
  defp do_send_command(%MarsRover{x: x, y: y, face: "S"}, ["R" | next_commands]) do
    build_rover(x, y, "W")
    |> do_send_command(next_commands)
  end

  defp build_rover(x, y, face), do: %MarsRover{x: x, y: y, face: face}
end
