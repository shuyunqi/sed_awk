
[root@liudehua ~]# cat 1.txt
aaaaaaa
bbbbbbbbbb
xx00:8008:kkkkkkk
ccccccccc
dddddddddddd

1111111111
22222222222
xxkk:8007:llslsl
333333333
44444444444
#sed -n 'N;N;/8007/{N;N;d};p' 1.txt
aaaaaaa
bbbbbbbbbb
xx00:8008:kkkkkkk
ccccccccc
dddddddddddd

#sed -n '$!N;$!N;/8007/{N;N;N;d};p;' 1.txt
aaaaaaa
bbbbbbbbbb
xx00:8008:kkkkkkk
ccccccccc
dddddddddddd


#sed -nr '1h;1!H;$b1;/^$/{:1;x;/8008/d;p}'
aaaaaaa
bbbbbbbbbb
xx00:8008:kkkkkkk
ccccccccc
dddddddddddd
###################################################################
1.需求将file文件中匹配到"xxoo"的行和它的上下两行（共5行）都删除。
[root@local_game_server2 test]# cat file
a
b
bb
c
d
xxoo
e
f
g
kklll
[root@local_game_server2 test]# sed  'N;N;/xxoo/{N;N;d}' file
a
b
bb
g
kklll
####################################################################
2.需求，将file文件中匹配到"xxoo"的行和它的上下两行（共5行）的行首部加上"#"
[root@local_game_server2 test]# cat file
a
b
bb
c
d
xxoo
e
f
g
kklll
[root@local_game_server2 test]# sed 'N;N;/xxoo/{N;N;s/^/#/;s/\n/\n#/g}' file
a
b
bb
#c
#d
#xxoo
#e
#f
g
kklll


awk '{a[NR]=$0;if(/xxoo/)b=NR}END{print "#"a[b-2],"#"a[b-1],"#"a[b],"#"a[b+1],"#"a[b+2]}' OFS="\n" file
