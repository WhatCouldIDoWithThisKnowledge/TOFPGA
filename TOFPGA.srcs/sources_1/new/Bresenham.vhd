library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;

entity Bresenham is
    generic(
        max_pos_X : integer := 1680;
        max_pos_Y : integer := 1024
    );
    port(
        curr_pos_X : in std_logic_vector(10 downto 0);
        curr_pos_Y : in std_logic_vector(9 downto 0);
        next_pos_X : in std_logic_vector(10 downto 0);
        next_pos_y : in std_logic_vector(9 downto 0);
        out_pos_X : in std_logic_vector(10 downto 0);
        out_pos_Y : in std_logic_vector(9 downto 0)
    );
end entity Bresenham;

architecture bh of Bresenham is
type pos is array(0 to 1) of integer;
signal curr_pos : pos;
signal next_pos : pos;
begin
    curr_pos(0) <= to_integer(unsigned(curr_pos_X));
    curr_pos(1) <= to_integer(unsigned(curr_pos_Y));
    next_pos(0) <= to_integer(unsigned(next_pos_X));
    next_pos(1) <= to_integer(unsigned(next_pos_Y));
    
    --TO FINISH
end architecture bh;