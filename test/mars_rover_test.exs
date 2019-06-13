defmodule MarsRoverTest do
  use ExUnit.Case

  test "add_rover/3 returns a MarsRover struct with the position" do
    assert %MarsRover{x: 1, y: 2, face: "N"} = MarsRover.add_rover(1, 2, "N")
    assert %MarsRover{x: 3, y: 3, face: "E"} = MarsRover.add_rover(3, 3, "E")
  end

  test "send_command/2 rotate the rover to West when the face is North and the command is to turn Left" do
    rover = MarsRover.add_rover(1, 2, "N")

    assert %MarsRover{x: 1, y: 2, face: "W"} = MarsRover.send_command(rover, "L")
  end

  test "send_command/2 rotate the rover to South when the face is West and the command is to turn Left" do
    rover = MarsRover.add_rover(1, 2, "W")

    assert %MarsRover{x: 1, y: 2, face: "S"} = MarsRover.send_command(rover, "L")
  end

  test "send_command/2 rotate the rover to East when the face is South and the command is to turn Left" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 2, face: "E"} = MarsRover.send_command(rover, "L")
  end

  test "send_command/2 rotate the rover to North when the face is East and the command is to turn Left" do
    rover = MarsRover.add_rover(1, 2, "E")

    assert %MarsRover{x: 1, y: 2, face: "N"} = MarsRover.send_command(rover, "L")
  end
end
