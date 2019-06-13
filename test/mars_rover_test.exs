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

  test "send_command/2 rotate the rover to North when the face is West and the command is to turn Right" do
    rover = MarsRover.add_rover(1, 2, "W")

    assert %MarsRover{x: 1, y: 2, face: "N"} = MarsRover.send_command(rover, "R")
  end

  test "send_command/2 rotate the rover to East when the face is North and the command is to turn Right" do
    rover = MarsRover.add_rover(1, 2, "N")

    assert %MarsRover{x: 1, y: 2, face: "E"} = MarsRover.send_command(rover, "R")
  end

  test "send_command/2 rotate the rover to South when the face is East and the command is to turn Right" do
    rover = MarsRover.add_rover(1, 2, "E")

    assert %MarsRover{x: 1, y: 2, face: "S"} = MarsRover.send_command(rover, "R")
  end

  test "send_command/2 rotate the rover to West when the face is South and the command is to turn Right" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 2, face: "W"} = MarsRover.send_command(rover, "R")
  end

  test "send_command/2 rotate the rover to South when the face is South and the command is to turn Right and turn Left" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 2, face: "S"} = MarsRover.send_command(rover, "RL")
  end

  test "send_command/2 rotate the rover to South when the face is South and the command is RLLR" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 2, face: "S"} = MarsRover.send_command(rover, "RLLR")
  end

  test "send_command/2 rotate the rover to North when the face is South and the command is RR" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 2, face: "N"} = MarsRover.send_command(rover, "RR")
  end

  test "send_command/2 increase y axis when the face is North and the command is to Move" do
    rover = MarsRover.add_rover(1, 2, "N")

    assert %MarsRover{x: 1, y: 3, face: "N"} = MarsRover.send_command(rover, "M")
  end

  test "send_command/2 decrease y axis when the face is South and the command is to Move" do
    rover = MarsRover.add_rover(1, 2, "S")

    assert %MarsRover{x: 1, y: 1, face: "S"} = MarsRover.send_command(rover, "M")
  end

  test "send_command/2 increase x axis when the face is East and the command is to Move" do
    rover = MarsRover.add_rover(1, 2, "E")

    assert %MarsRover{x: 2, y: 2, face: "E"} = MarsRover.send_command(rover, "M")
  end

  test "send_command/2 decrease x axis when the face is West and the command is to Move" do
    rover = MarsRover.add_rover(1, 2, "W")

    assert %MarsRover{x: 0, y: 2, face: "W"} = MarsRover.send_command(rover, "M")
  end
end
