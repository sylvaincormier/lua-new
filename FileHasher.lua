local md5 = require("md5")
local io = require("io")

-- Function to compute the MD5 hash of a file
local function hashFile(filePath)
    local file = io.open(filePath, "rb")  -- Read the file in binary mode
    if not file then
        print("Error opening file: " .. filePath)
        return nil
    end

    local content = file:read("*all")  -- Read the entire content of the file
    file:close()
    return md5.sumhexa(content)  -- Compute and return the MD5 hash
end

-- Main program
local function main()
    print("Enter the path of the file to hash:")
    local filePath = io.read()  -- Read the file path from the user input
    local fileHash = hashFile(filePath)

    if fileHash then
        print("MD5 Hash of " .. filePath .. ": " .. fileHash)
    else
        print("Failed to compute hash.")
    end
end

main()
