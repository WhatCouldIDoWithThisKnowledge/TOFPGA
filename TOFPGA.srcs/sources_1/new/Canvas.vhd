library IEEE;
use IEEE.std_logic_1164.all;

library work;


--Add new inputs and/or outputs as needed (for upgrades)
entity Canvas is
    port(
        position_X : in std_logic_vector(10 downto 0);
        position_Y : in std_logic_vector(9 downto 0);
        stop : in std_logic;
        clk : in std_logic;
        VGA : out std_logic
    );
end entity Canvas;

architecture bh of Canvas is
signal helper_1 : std_logic_vector(10 downto 0) := b"0000000000";
signal helper_2 : std_logic_vector(10 downto 0) := b"0000000000";
begin
    position_X_buffer : entity work.position_buffer(Canvas)
        port map(
            E => position_X,
            clk => clk,
            enable => stop,
            rs => '0',
            output => stop,
            S => helper_1
        );
    position_Y_buffer : entity work.position_buffer(Canvas)
        port map(
            E => position_Y,
            clk => clk,
            enable => stop,
            rs => '0',
            output => stop,
            S => helper_2
        );
        
    --FINISH FIRTS BRESENHAM
end architecture bh;