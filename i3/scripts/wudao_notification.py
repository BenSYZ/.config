import os
import subprocess

def getClipboardData():
    p = subprocess.Popen(['xclip','-selection', 'clipboard', '-o'], stdout=subprocess.PIPE)
    #retcode = p.wait()
    data = p.stdout.read()
    return data

#def setClipboardData(data):
#    p = subprocess.Popen(['xclip','-selection','clipboard'], stdin=subprocess.PIPE)
#    p.stdin.write(data)
#    p.stdin.close()
#    retcode = p.wait()



def wudao_dict():
    #to_be_trans = getClipboardData().decode()
    #to_be_trans = to_be_trans.strip()
    ##print(to_be_trans)
    ##to_be_trans = 'strip'

    to_be_trans=0
    #to_be_trans = os.popen('xsel').read()
    if not to_be_trans:
        to_be_trans = getClipboardData().decode().strip()

    sed = r'| sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
    cmd = 'wd '+ to_be_trans + sed
    #print(cmd)
    wd_result = os.popen(cmd)
    translation = ''

    for line in wd_result:
        if line == '\n': continue
        translation += line
        #if line.startswith('CET'):break
        #print(line,end='')
        #text = pat.search(line)
        #print(text)
    translation = translation.replace('\"','\'')


    cmd = "notify-send \""+ translation +"\" -t 10000 -h int:transient:1 -c dict"
    print(cmd)
    os.system(cmd)
wudao_dict()

#print(getClipboardData())


