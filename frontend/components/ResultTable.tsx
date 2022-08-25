import { Table, Thead, Tr, Th, Td, Box, Image, Tbody, Link } from '@chakra-ui/react'

export function ResultTable({ data }: { data: any }) {
  return (
    <Box mt={4} overflowX={{base:"auto", sm:"auto", md: "auto"}}>
      <Table size="sm" mt={4}>
        <Thead>
          <Tr>
            <Th >順位</Th>
            <Th>再生数</Th>
            <Th>リンク</Th>
            <Th>タイトル</Th>
            <Th>投稿日</Th>
          </Tr>
        </Thead>
        <Tbody>
          {data.map((d: any, index: number) => (
            <Tr key={index}>
              <Td minW={16}>{d.rank}</Td>
              <Td minW={12}>{d.daily}</Td>
              <Td minW={20}>
                <Link href={d.url} target="_blank" rel="noopener">
                <Image
                  htmlWidth="80px"
                  maxHeight="40px"
                  objectFit='cover'
                  src={d.thumbnail}
                  alt={d.title}
                />
                </Link>
              </Td>
              <Td minW={48}>{d.title}</Td>
              <Td minW={32}>{d.date}</Td>
            </Tr>
          ))}
        </Tbody>
      </Table>
    </Box>
  )
}