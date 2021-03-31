import argparse

non_chars = ('caps', 'shift', 'ctrl', 'alt', 'space', 'enter', 'del', 'tab')
special_chars = ('-', '=', '<')


def decode_special_chars(item):
    if item == '<':
        return '2c'
    elif item == '-':
        return '2d'
    elif item == '=':
        return '3d'
    else:
        return 'ffff'
    

def to_vhdl_when(scancode_string):
    try:
        scancode, character = scancode_string.split(',')
    except:
        print('ERRO split:', scancode_string)

    if not character in non_chars:
        if character in special_chars:
            hex_char = decode_special_chars(character)
        else:
            try:
                hex_char = hex(ord(character)).split('x')[-1]
            except :
                print('ERROR convert:', character)

        vhdl_format = 'when '+ scancode + ' => ascii_out <= x\"' + hex_char + '\";\n'

        return vhdl_format
    return ''

def main(args):
    lines = []

    with open(args.path, 'r') as fp:
        for x in fp:
            lines.append(to_vhdl_when(x.rstrip()))

    with open(args.out, 'w') as fp:
        for line in lines:
            fp.write(line)

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--path', type=str, required=True, help='Scancode txt file')
    parser.add_argument('--out', type=str, required=True, help='ascii output')
    args = parser.parse_args()
    
    main(args)
