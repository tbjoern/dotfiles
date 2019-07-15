#! /usr/bin/env python

def parse_xresources(lines):
    resources = {}
    defines = {}
    for line in lines:
        line = line.strip()
        if line is "" or line[0] == '!':
            continue
        if '#define' in line:
            _, varname, value = [x.strip() for x in line.split()]
            defines[varname] = value
        else:
            token, value = [x.strip() for x in line.split(':', 1)]
            token = token.strip('*')
            resources[token] = value
    return resources, defines

token_map = {
    "foreground": "foreground",
    "background": "background",
    "color8":  "black_intense",
    "color0":  "black",
    "color9":  "red_intense",
    "color1":  "red",
    "color10": "green_intense",
    "color2":  "green",
    "color11": "orange_intense",
    "color3":  "orange",
    "color12": "blue_intense",
    "color4":  "blue",
    "color13": "pink_intense",
    "color5":  "pink",
    "color14": "cyan_intense",
    "color6":  "cyan",
    "color15": "white_intense",
    "color7":  "white",
}

def resolve_defines(resources, defines):
    for resource, value in resources.items():
        if value in defines:
            resources[resource] = defines[value]

def write_resources_as_variables(resources, name_map, writer, var_prefix):
    for resource, value in resources.items():
        if resource in name_map:
            writer(f"#define {var_prefix}{name_map[resource]} {value}")

def main():
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('file', help=".Xresource file to parse")
    parser.add_argument('-p', '--prefix', help="string to put in front of variables - e.g. 'pref_' -> 'pref_variable'")

    args = parser.parse_args()

    try:
        with open(args.file, 'r') as f:
            lines = f.readlines()
    except:
        print(f"Unable to open file {args.file}")
        exit(1)
    
    resources, defines = parse_xresources(lines)

    resolve_defines(resources, defines)

    if args.prefix:
        prefix = args.prefix
    else:
        prefix = ""

    write_resources_as_variables(resources, token_map, print, prefix)

if __name__ == "__main__":
    main()