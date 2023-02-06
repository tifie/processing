import tkinter
import tkinter
import random

####メイン画面の生成####
root = tkinter.Tk()
root.title("マインスイーパ")
root.resizable(0, 0)  # サイズ変更不可にする
###メニュー作成###
menu_ROOT = tkinter.Menu(root)
root.configure(menu=menu_ROOT)
menu_GAME = tkinter.Menu(menu_ROOT, tearoff=False)
menu_ROOT.add_cascade(label='ゲーム', menu=menu_GAME)
menu_GAME.add_command(label="終了")

###フレームオブジェクト作成###
root_frame = tkinter.Frame(root, relief='groove',
                           borderwidth=5, bg='LightGray')
game_frame = tkinter.Frame(root_frame, relief='sunken',
                           borderwidth=3, bg='LightGray')
root_frame.pack()
game_frame.pack(pady=5, padx=5)

####マス目の作成####
bomb_list = []


def left_click(event):
    event.widget.configure(relief='ridge', bd='1')
    except_num = event.widget.num
    if len(bomb_list) == 0:
        while len(bomb_list) != 10:
            bomb_num = random.randint(0, 80)
            if bomb_num != except_num and (bomb_num in bomb_list) == False:
                bomb_list.append(bomb_num)
    bomb_count = search_bomb(bomb_list, event.widget.num)
    if bomb_count == 9:
        for i in bomb_list:
            frame_list[i].configure(bg='red')
        for i in frame_list:
            i.bind("<1>", stop)
    else:
        bomb_count_label = tkinter.Label(
            event.widget, text=bomb_count, bg='LightGray')
        bomb_count_label.place(width=28, height=28)
        event.widget.bind("<1>", stop)


i = 0
frame_list = []
for x in range(9):
    for y in range(9):
        frame = tkinter.Frame(game_frame, width=30, height=30,
                              bd=3, relief='raised', bg='LightGray')
        frame.bind("<1>", left_click)
        frame.num = i
        frame_list.append(frame)
        frame.grid(row=x, column=y)
        i += 1


def search_bomb(list, num):
    around_list = []
    bomb_count = 0
    if num in list:
        return 9
    if num % 9 == 0:
        around_list.append(num-9)
        around_list.append(num-8)
        around_list.append(num+1)
        around_list.append(num+9)
        around_list.append(num+10)
    elif num % 9 == 8:
        around_list.append(num-10)
        around_list.append(num-9)
        around_list.append(num-1)
        around_list.append(num+8)
        around_list.append(num+9)
    elif num < 9:
        around_list.append(num-1)
        around_list.append(num+1)
        around_list.append(num+8)
        around_list.append(num+9)
        around_list.append(num+10)
    elif num > 72:
        around_list.append(num-10)
        around_list.append(num-9)
        around_list.append(num-8)
        around_list.append(num-1)
        around_list.append(num+1)
    else:
        around_list.append(num-10)
        around_list.append(num-9)
        around_list.append(num-8)
        around_list.append(num-1)
        around_list.append(num+1)
        around_list.append(num+8)
        around_list.append(num+9)
        around_list.append(num+10)
    for i in around_list:
        if i in list:
            bomb_count += 1
    return bomb_count


def stop(event):
    pass


root.mainloop()