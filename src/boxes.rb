require 'tty-box'

def create_box_structure
    #top row
    box1 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 0, left: 0,
    title: { bottom_right: '1'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box2 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 0, left: 30,
    title: {bottom_right: '2'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box3 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 0, left: 60,
    title: {bottom_right: '3'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box4 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 0, left: 90,
    title: {top_left: 'FINISH', bottom_right: '4'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    print box1
    print box2
    print box3
    print box4

    #2nd row
    box5 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 8, left: 0,
    title: {bottom_right: '5'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box6 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 8, left: 30,
    title: {bottom_right: '6'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box7 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 8, left: 60,
    title: {bottom_right: '7'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box8 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 8, left: 90,
    title: {bottom_right: '8'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end
    print box5
    print box6
    print box7
    print box8

    #2nd row
    box9 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 16, left: 0,
    title: {bottom_right: '9'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box10 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 16, left: 30,
    title: {bottom_right: '10'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box11 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 16, left: 60,
    title: {bottom_right: '11'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box12 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 16, left: 90,
    title: {bottom_right: '12'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end
    print box9
    print box10
    print box11
    print box12

#4nd row
box13 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 24, left: 0,
    title: {top_left: 'START', bottom_right: '13'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box14 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 24, left: 30,
    title: {bottom_right: '14'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box15 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 24, left: 60,
    title: {bottom_right: '15'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end

    box16 = TTY::Box.frame(
    width: 30,
    height: 8,
    align: :center,
    padding: 3,
    top: 24, left: 90,
    title: {bottom_right: '16'},
    border: {
        type: :light,
        bottom: true
    }
    ) do
    "Drawing a box in terminal emulator"
    end
    print box13
    print box14
    print box15
    print box16
end
