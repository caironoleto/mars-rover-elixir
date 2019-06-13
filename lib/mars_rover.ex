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

  defp do_send_command(%MarsRover{x: x, y: y, face: face}, [command | next_commands])
       when command == "L" do
    face
    |> rotate_left()
    |> build_rover(x, y)
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: face}, [command | next_commands])
       when command == "R" do
    face
    |> rotate_right()
    |> build_rover(x, y)
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "N"}, [command | next_commands])
       when command == "M" do
    build_rover("N", x, y + 1)
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "E"}, [command | next_commands])
       when command == "M" do
    build_rover("E", x + 1, y)
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "S"}, [command | next_commands])
       when command == "M" do
    build_rover("S", x, y - 1)
    |> do_send_command(next_commands)
  end

  defp do_send_command(%MarsRover{x: x, y: y, face: "W"}, [command | next_commands])
       when command == "M" do
    build_rover("W", x - 1, y)
    |> do_send_command(next_commands)
  end

  defp build_rover(face, x, y), do: %MarsRover{x: x, y: y, face: face}
  defp rotate_left(face) when face == "N", do: "W"
  defp rotate_left(face) when face == "W", do: "S"
  defp rotate_left(face) when face == "S", do: "E"
  defp rotate_left(face) when face == "E", do: "N"

  defp rotate_right(face) when face == "N", do: "E"
  defp rotate_right(face) when face == "E", do: "S"
  defp rotate_right(face) when face == "S", do: "W"
  defp rotate_right(face) when face == "W", do: "N"
end
