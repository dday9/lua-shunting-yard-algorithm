local function isWhitespace(char)
    local whitespaceAscii = {
        [32] = true, -- space
        [9] = true,  -- tab
        [10] = true, -- newline (LF)
        [13] = true, -- carriage return (CR)
    }
    local charAscii = char:byte()
    return whitespaceAscii[charAscii]
end

local function isOperator(char)
    local operators = {"+", "-", "*", "/", "^"}
    for i = 1, #operators do
        if operators[i] == char then
            return true
        end
    end
    return false
end

local function getPrecedence(operator)
    if operator == "+" or operator == "-" then
        return 1
    elseif operator == "*" or operator == "/" then
        return 2
    elseif operator == "^" then
        return 3
    end
    return 0
end

local function shuntingYardAlgorithm(expression)
    local outputQueue = {}
    local operatorStack = {}

    local i = 1
    while i <= #expression do
        local token = expression:sub(i, i)
        if (isWhitespace(token)) then
            goto continue
        elseif tonumber(token) then
            local number = "";
            while i <= #expression and tonumber(expression:sub(i, i)) do
                local token = expression:sub(i, i)
                number = number .. token
                i = i + 1
            end
            i = i - 1
            table.insert(outputQueue, number)
        elseif isOperator(token) then
            while #operatorStack > 0 and isOperator(operatorStack[#operatorStack]) and
                  getPrecedence(token) <= getPrecedence(operatorStack[#operatorStack]) do
                table.insert(outputQueue, table.remove(operatorStack))
            end
            table.insert(operatorStack, token)
        elseif token == "(" then
            table.insert(operatorStack, token)
        elseif token == ")" then
            while #operatorStack > 0 and operatorStack[#operatorStack] ~= "(" do
                table.insert(outputQueue, table.remove(operatorStack))
            end
            if operatorStack[#operatorStack] == "(" then
                table.remove(operatorStack)
            end
        end
        ::continue::
        i = i + 1
    end

    while #operatorStack > 0 do
        table.insert(outputQueue, table.remove(operatorStack))
    end

    return outputQueue
end