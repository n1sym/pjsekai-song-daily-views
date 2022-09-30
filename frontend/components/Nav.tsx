import {
  Box,
  Flex,
  Heading,
} from '@chakra-ui/react';

export function Nav() {
  return (
    <>
      <Box pt={4}>
        <Flex h={16} alignItems={'center'} justifyContent={'space-between'}>
          <Heading size="md">プロセカ動画デイリーランキング</Heading>
        </Flex>
      </Box>
      <hr></hr>
    </>
  );
}