import puppeteer, { Browser, Page } from 'puppeteer'
import { IndexPageTest, PageInitFunction } from './pages'

describe('MotivyClientTesting', () => {

    const pageInit: PageInitFunction = async (path: string) => {
        let browser: Browser | null = null
        let page: Page | null = null
        try {
            browser = await puppeteer.launch({headless: true})
            page = await browser.newPage()
            await page.goto(`http://localhost:3000${path}`, {
                waitUntil: 'networkidle2'
            })
        } catch(e) {
            console.error(`==> Something went wrong, probably several tests couldn't be performed!`)
            page = null
            if ( browser ) await browser.close()
        }
        
        return { page, browser }
    }
    // Add more tests here
    IndexPageTest(pageInit)
})



