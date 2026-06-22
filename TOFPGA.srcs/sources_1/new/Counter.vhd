library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Counter is
    port(
        rs, clk : in std_logic;
        S : out std_logic_vector(31 downto 0)
    );
end entity Counter;

architecture bit_32 of Counter is
begin

end architecture bit_32;