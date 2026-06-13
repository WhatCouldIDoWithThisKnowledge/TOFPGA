library IEEE;
use IEEE.std_logic_1164.all;

library work;

--FINISHED

--For saving a position on only one axis.
entity position_buffer is
    port(
        E : in std_logic_vector(10 downto 0);
        clk : in std_logic;
        enable : in std_logic;
        rs : in std_logic;
        output : in std_logic;
        S : out std_logic_vector(10 downto 0)
    );
end entity position_buffer;

architecture bh of position_buffer is
signal helper: std_logic_vector(10 downto 0) := b"0000000000";
begin
    
    D_ff_1 : entity work.D_ff 
        port map(
            E => E(0),
            clk => clk,
            rs => '0',
            pr => '0',
            enable => enable,
            S => helper(0),
            noS => open
        );
    GENERATE_D_ff : for ii in 1 to 10 generate
    D_ff : entity work.D_ff
        port map(
            E => helper(ii - 1),
            clk => clk,
            rs => '0',
            pr => '0',
            enable => enable,
            S => helper(ii),
            noS => open
        );
    end generate GENERATE_D_FF;
    
    Tristate_block : entity work.Tristate_block
        port map(
            E => helper,
            enable => output,
            S => S
        );
end architecture bh;

library IEEE;
use IEEE.std_logic_1164.all;

library work;

architecture canvas of position_buffer is
signal helper : std_logic_vector(10 downto 0) := b"0000000000";
begin
    GENERATE_D_ff : for ii in 0 to 10 generate
    D_ff : entity work.D_ff
        port map(
            E => E(ii),
            clk => clk,
            rs => rs,
            pr => '0',
            enable => enable,
            S => helper(ii),
            noS => open
        );
    end generate GENERATE_D_ff;
        
     Tristate_block : entity work.Tristate_block
        port map(
            E => helper,
            enable => enable,
            S => S
        );
end architecture canvas;