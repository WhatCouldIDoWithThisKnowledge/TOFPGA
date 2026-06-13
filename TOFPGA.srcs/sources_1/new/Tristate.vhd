library IEEE;
use IEEE.std_logic_1164.all;

entity Tristate is
    port(
        E : in std_logic;
        enable : in std_logic;
        S : out std_logic
    );
end entity Tristate;

architecture bh of Tristate is
begin
    S <= '1' when (E = enable and enable /= '0') else 'Z';
end architecture bh;



--FINISHED
library IEEE;
use IEEE.std_logic_1164.all;

entity Tristate_block is
    port(
        E : in std_logic_vector(10 downto 0);
        enable : in std_logic;
        S : out std_logic_vector(10 downto 0)
    );
end entity Tristate_block;

architecture bh of Tristate_block is
begin
    GEN_TRISTATE : for ii in 0 to 10 generate
        tristate : entity work.Tristate
            port map(
                E => E(ii),
                enable => enable,
                S => S(ii)
            );
         end generate GEN_TRISTATE;
end architecture bh;