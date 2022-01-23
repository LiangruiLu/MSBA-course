"""
File: RGB.py
"""
def rgbToHexString(rgbTriple):
    """Converts the rgbTriple (R, G, B) to a hex string of the form #RRGGBB."""
    hexString = ""
    for val in rgbTriple: # Iterate through the triple
        twoDigits = hex(val)[2:]
        if len(twoDigits) == 1:
            twoDigits = '0' + twoDigits
        hexString += twoDigits
    return '#' + hexString
