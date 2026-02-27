--kudos to https://github.com/amirrezaask/start.nvim/tree/master
--to change the ascii, edit the well, ascii. starting line 22
--if you're not planning to have neotree open, you need to go to local start_col and change "width-40" to just "width"

local api = vim.api


local M = {}

local function string_to_lines_table(ascii)
   local lines = {}
   local line_start = 1
   for i=1,#ascii do
      if string.sub(ascii, i, i) == '\n' then
         local this_line = string.sub(ascii, line_start, i-1)
         line_start = i+1
         table.insert(lines, this_line)
      end
   end
   return lines
end
M['ascii'] = [[
⠀⠀⠀⣿⣦⡀⠀⠀⠀⠀⢀⡄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⡿⠻⢶⣤⣶⣾⣿⠁⠀⢽⣆⡀⢀⣴⠀⠀⠀⠀⠀⠀⠀⠀     ██╗    ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
⠀⠀⣀⣽⠉⠀⠀⠀⣠⣿⠃⠀⠀⢀⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║⠀⠀
⠴⣾⣿⣀⣀⠀⠀⠈⠉⢻⣦⡀⠚⠻⠿⣿⣿⠿⠛⠂⠀⠀⢀⣧⠀⠀⠀⠀  ⠀██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
⠀⠀⠀⠉⢻⣇⠀⣾⣿⣿⣿⣿⣤⠀⠀⣿⠁⠀⠀⠀⢀⣴⣿⣿⠀⠀⠀⠀  ⠀██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
⠀⠀⠀⠀⠸⣿⣷⠏⠀⢀⠀⠀⠿⣶⣤⣤⣤⣄⣀⣴⣿⣿⢿⣿⡆⠀⠀⠀⠀⠀⠀██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
⠀⠀⠀⠀⠀⠟⠁⠀⢀⣾⠀⠀⠀⠩⣿⣿⠿⠿⠿⡿⠋⠀⠘⣿⣿⡆⡀⠀⠀⠀⠀╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
⠀⠀⠀⠀⠀⢳⣶⣶⣿⣿⣅⠀⠀⠀⠙⣿⣆⠀⠀⠀⠀⠀⠀⠛⠿⣿⣮⣤⣀⠀   ---------------hejkohejko setup---------------⠀
⠀⠀⠀⠀⠀⠀⣹⣿⣿⣿⣿⠿⠋⠁⠀⣹⣿⠳⠀⠀⠀⠀⠀⠀⢀⣤⣽⣿⣿⠟⠋
⠀⠀⠀⠀⠀⣴⠿⠛⠻⢿⣿⠀⠀⠀⣰⣿⠏⠀⠀⠀⠀⠀⠀⣾⣿⠟⠋⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠀⠀⣰⣿⣿⣿⣿⣿⣿⣷⣄⢀⣿⣿⡁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠉⠁⠀⠀⠀⠀⠙⢿⣿⣿⠇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀
]]

M['location'] = {
   center = function(width, height, ascii_col, ascii_lines)
      local h = math.floor((height /2) - (ascii_lines / 2))
      local w = math.floor((width /2) - (ascii_col / 2))
      return w,h
   end
}

local function str_repeat(str, number)
   local s = ""
   for _=1,number do
      s = s .. str
   end
   return s
end

local set_startup = function(ascii)
   local height = vim.api.nvim_get_option('lines')
   local width = vim.api.nvim_get_option('columns')
   local lines = string_to_lines_table(ascii)
   local ascii_col = #lines[1]
   local ascii_lines = #lines
   local start_col, start_row = M.location.center(width-40, height, ascii_col, ascii_lines)
   if vim.fn.argc() < 1 then
      local buf = vim.api.nvim_create_buf(true, true)
      for i, _ in ipairs(lines) do
         lines[i] = (str_repeat(' ', start_col)) .. (lines[i])
      end
      local new_lines = {}
      for _=1,start_row do
         table.insert(new_lines, '')
      end
      for _, l in ipairs(lines) do
         table.insert(new_lines, l)
      end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, new_lines)
      vim.api.nvim_buf_set_option(buf, 'modifiable', false)
      vim.api.nvim_buf_set_option(buf, 'buflisted', false)
      local win = api.nvim_get_current_win()
      api.nvim_set_current_buf(buf)
   end
end

set_startup(M['ascii'])
