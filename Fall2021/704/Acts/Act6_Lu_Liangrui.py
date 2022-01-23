import tkinter as tk


def Add():
    # Increase the counter value by 1
    global counter
    counter += 1
    # global txtCount
    txtCount.config(text=counter)
    return None


def Reset():
    # Reset the counter value to 0
    global counter
    counter = 0
    # global txtCount
    txtCount.config(text=counter)
    return None


counter = 0
window = tk.Tk()  # Create a top-level widget main window
window.title("Terps")  # Set window title
txtCount = tk.Label(window, text=counter)  # Create a text label
txtCount.pack()  # Show the text label
btnAdd = tk.Button(window, text="Add 1", command=Add)
# Create a command button
btnAdd.pack()  # Show the command button
btnReset = tk.Button(window, text="Reset to 0", command=Reset)  # Create another command button
btnReset.pack()  # Show the command button
window.mainloop()  # Begin waiting for events

