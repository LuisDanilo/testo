import puppeteer, { Browser, Page } from 'puppeteer'
import { IndexPageTest, PageInitFunction } from './pages'

describe('MotivyClientTesting', () => {

    const pageInit: PageInitFunction = async (path: string) => {
        let browser = await puppeteer.launch({headless: true})
        let page = await browser.newPage()
        await page.goto(`http://localhost:3000${path}`)
        return { page, browser }
    }
    // Add more tests here
    IndexPageTest(pageInit)
})



