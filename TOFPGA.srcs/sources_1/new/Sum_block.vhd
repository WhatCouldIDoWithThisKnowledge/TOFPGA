library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Sum_block is
    port(
        E1, E2 : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end entity Sum_block;

architecture bit_32 of Sum_block is
begin
    Generate_loop : for ii in 0 to 31 generate
        Sum_gen : entity work.Sum
            port map(
                E1 => E1(ii),
                E2 => E2(ii),
                S => S(ii)
            );
        end generate Generate_loop;
end architecture bit_32;

architecture is_not_0 of Sum_block is
signal helper : std_logic_vector(28 downto 0) := (others => '0');
begin
    Sum : entity work.Sum
        port map(
            E1 => E1(0),
            E2 => E1(1),
            S => helper(0)
        );
    Generate_loop : for ii in 1 to 29 generate
        Sum_gen : entity work.Sum
            port map(
                E1 => E1(ii + 1),
                E2 => helper(ii - 1),
                S => helper(ii)
            );
        end generate Generate_loop;

        S(0) <= helper(30);
end architecture is_not_0;


architecture is_min_int of Sum_block is
signal helper : std_logic_vector(28 downto 0) := (others => '0');
begin
    Sum : entity work.Sum
        port map(
            E1 => E1(0),
            E2 => E1(1),
            S => helper(0)
        );
    Generate_loop : for ii in 1 to 28 generate
        Sum_gen : entity work.Sum
            port map(
                E1 => E1(ii + 1),
                E2 => helper(ii - 1),
                S => helper(ii)
            );
        end generate Generate_loop;
        S(0) <= (not helper(28)) and E1(31);
end architecture is_min_int;