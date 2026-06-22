library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity T_ff is
    port(
        clk, E, rs, enable : in std_logic;
        Q, nQ : out std_logic
    );
end entity T_ff;

architecture bh of T_ff is
signal helper : std_logic := '0';
begin
    process(clk)
    begin
        if rs = '1' then
            helper <= '0';
        elsif rising_edge(clk) then
            helper <= E xor helper;
        end if;
    end process;
    Q <= helper;
    nQ <= not helper;
end architecture bh;