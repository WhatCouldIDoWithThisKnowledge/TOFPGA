library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Tristate_block is
    port(
        E : in std_logic_vector(31 downto 0);
        enable : in std_logic;
        S : out std_logic_vector(31 downto 0)
    );
end entity Tristate_block;


architecture bit_11 of Tristate_block is
begin
    Generate_loop : for ii in 0 to 10 generate
        Tristate_gen : entity work.Tristate
            port map(
                E => E(ii),
                enable => enable,
                S => S(ii)
            );
        end generate Generate_loop;
end architecture bit_11;


architecture bit_32 of Tristate_block is
begin
    Generate_loop : for ii in 0 to 31 generate
        Tristate_gen : entity work.Tristate
            port map(
                E => E(ii),
                enable => enable,
                S => S(ii)
            );
        end generate Generate_loop;
end architecture bit_32;