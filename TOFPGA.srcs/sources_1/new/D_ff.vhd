library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity D_ff is
    port(
        E, clk, enable, rs, pr : in std_logic;
        Q, nQ : out std_logic
    );
end entity D_ff;

architecture bh of D_ff is
signal helper : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if pr = '1' then
                helper <= '1';
            elsif rs = '1' then
                helper <= '0';
            else
                helper <= E;
            end if;
        end if;
    end process;
    Q <= helper;
    nQ <= not helper;
end architecture bh;