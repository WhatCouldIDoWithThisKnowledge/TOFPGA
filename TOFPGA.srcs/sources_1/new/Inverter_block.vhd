library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Inverter_block is
    port(
        E : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end entity Inverter_block;

architecture bit_32 of Inverter_block is
begin
    Generate_loop : for ii in 0 to 31 generate
        Generate_inv : entity work.Inverter
            port map(
                E => E(ii),
                S => S(ii)
            );
        end generate Generate_loop;
end architecture bit_32;