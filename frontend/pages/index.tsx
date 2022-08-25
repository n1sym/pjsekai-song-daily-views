import type { NextPage } from 'next'
import Head from 'next/head'
import { Box, Container, Heading, Flex } from '@chakra-ui/react'
import { Layout } from "../components/Layout"
import latestDailyData from '../data/latest_daily.json'
import { ResultTable } from '../components/ResultTable'

const siteTitle = "pjsekai-daily-ranking"

const Home: NextPage = () => {
  return (
    <Layout>
      <Head>
        <title>{siteTitle}</title>
        <meta name="description" content="A page summarizing the riding results of this week's jockeys in horse racing" />
        <meta name="og:title" content={siteTitle} />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main>
        <ResultTable data={latestDailyData}></ResultTable>
      </main>
    </Layout>
  )
}

export default Home
