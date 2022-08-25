import {
  Box,
  Flex,
  Button,
  Heading,
  Stack,
  useColorMode,
} from '@chakra-ui/react';
import { MoonIcon, SunIcon } from '@chakra-ui/icons';

export function Nav() {
  const { colorMode, toggleColorMode } = useColorMode();
  return (
    <>
      <Box pt={4}>
        <Flex h={16} alignItems={'center'} justifyContent={'space-between'}>
          <Heading size="md">プロセカ動画デイリーランキング</Heading>
          <Flex alignItems={'center'}>
            <Stack direction={'row'} spacing={7}>
              <Button onClick={toggleColorMode} mr={2}>
                {colorMode === 'light' ? <MoonIcon /> : <SunIcon />}
              </Button>
            </Stack>
          </Flex>
        </Flex>
      </Box>
      <hr></hr>
    </>
  );
}