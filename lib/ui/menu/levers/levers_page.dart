
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/appbar_widgets.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LeversPage extends StatefulWidget {
  const LeversPage({Key? key}) : super(key: key);

  @override
  State<LeversPage> createState() => _LeversPageState();
}

class _LeversPageState extends State<LeversPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String title1 = 'To create a common language on how to grow, Bridgewhat developed a proprietary framework that includes 20 Levers of Growth (20 LOG) organised around five stages of client engagement - Attraction, Acquisition, ARPU, Retention, Referrals.\n\nTo see the BridgeWhat 20 LOG and their connection to the 5 stages of client engagement, please click the animated loop.';
  Map<int,Map<String,String>> structure1 = {
    1 : {
      'PT' : 'Positioning & Targeting|What market segments should I target? What are my Unique Selling Propositions by segment?…|Identify your client’s Job-To-Be-Done and offer unique products and services.\n\nEvery company needs to find a niche in which their avatar of the ideal client is presently trying to accomplish certain objectives, avoiding threats, or aims to achieve some goals while moving away from risks/fears. A more detailed perspective to identify what clients want is to ask them what is their Job-To-Be-Done (JTBD), usually translated (from clients’ point of view) in expressions such as “Help me... Help me avoid... or I need to...” or “When… I want… so I can...”. Market Research can be of great value at this stage.\n\nOnce a company discovers their clients’ desired outcomes, which clarify how clients measure the level of success in achieving the JTBD (what adds value to clients), it can then address an under-served market in terms of their client\'s desired outcomes or needs. This is done in the form of a value proposition, through which a company puts together JTBD, unrealized gains, and unsolved problems, and communicates to clients why it can serve them better or cheaper than competitors, in a sustainable manner.\n\nOne very important aspect of Positioning and Targeting is also to clarify what segments (products and services vs clients) the company will not address.\n\nIn summary: Initially and periodically, companies define their target clients and the portfolio of products and services to address them with a specific value proposition not easily replicable by competitors.',
      'DM' : 'Digital Marketing|What should be my digital positioning? How do I track my digital traffic & conversation?…|Create an online presence, engage positively with your clients, and track your performance.\n\nAn online presence is “easily” created through websites, landing pages, social networks, blogs… Nevertheless, these digital media by themselves do not guarantee visibility. Visibility requires additional developments and investments in i) Search Engine Optimization (SEO), so Google algorithms show your company before others; ii) Pay-per-Click Advertising (PPC), usually associated with Google’s AdWords programs, which drive targeted prospects to companies’ websites; iii) Banner Ads, displaying advertising that appears in other websites, or iv) Analytics, through which companies understand who their visitors are and what they are looking for.\n\nOne of the most important aspects of Digital Marketing is content: content creation and content curation. In turn, one of the most important aspects of content creation is storytelling, following a four-step structure: setting, complication, turning point, and resolution. According to Adams & Bosworth, there are seven types of stories, divided into three categories: i) HOOK stories (Create proximity via 1-Personal stories, 2-Key Staff stories, and 3-Company Creation and challenges stories), to connect with clients; ii) FIGTH stories (based on 4-Discovering Insights to clients and tell them 5-Success stories), to differentiate from competitors and show value; and iii) LAND stories (about 6-Value creation to clients and 7-Teaching on how to navigate internal politics to close a deal).\n\nIn summary: Digital Marketing represents the different strategies and tactics to increase visibility and engagement through digital media.',
      'TG' : 'Traffic generation|How do I drive desirable customers to my “stores”? What traffic metrics & tools should I use?…|Foster both online and foot traffic and the use of analytical tools to measure them.\n\nUsually, there are three types of traffic: Cold (not aware of a need), Tepid (not looking for anything, but a potential buyer), and Hot (actively searching for a solution).\n\nAccording to Brunson & Graziosi, there are four stages of engagement on online funnels: Lead, Unboxing, Presentation, and Phone. Lead funnel (Hook and Story): transforms traffic that one does not control yet (found where the avatars congregate) into traffic one earns (company’s audience) and, subsequently, in own traffic (company’s mail list).\n\nUnboxing funnel (Offer): once you capture clients’ emails using a lead funnel, you must reward them (offer) for it and keep them interested in moving on to the next stage of your sales process.\n\nPresentation funnel: here a company puts together a webinar or other type of group event, to present their offer to a collection of potential clients. Phone (or one-to-one) funnel: it is the last stage of lead capture and the first step of pipeline development, through which an opportunity must be converted into a sale.\n\nThis funnel model can be equated to the brick-and-mortar business, starting with the same engagement sequence: Hook (awareness), Story (value perception), Offer (solution).\n\nIn summary: By developing traffic generation, companies look for increasing the presence of clients in their marketing and sales channels.',
      'CM' : 'CRM Marketing|How do I establish long term positive interactions with my clients? What IT tools should I use?…|Build a long-term relationship with clients, by using the appropriate tools to automate contacts.\n\nStrategic CRM: is focused on client-centricity and on responding to how to better address the targeted markets.\n\nOperational CRM: it is translated into sales force automation and effectiveness, on one hand, in marketing (and campaigns) automation, and on the other, in capturing reciprocal synergies.\n\nAnalytic (Data) CRM: essential to persona-segmentation, picks and treats information about clients and their experience in both marketing and sales channels, allowing companies to collect and exchange strategic insights.\n\nCollaborative CRM: establishes the connections to exchange operational and strategic data on an ongoing basis, thus creating a value network of partners. The word “Marketing” after CRM raises awareness of the importance of the traditional Kotler’s 4 P – Product, Price, Place, and Promotion – for a content-based CRM:\n\nProduct: relates to the configuration of the products and services that fulfill a job-to-be-done, in a co-creation environment where clients’ perspectives are collected and embodied in the company’s offer, to increase customer value.\n\nPrice: as to do with i) a sustainable balance between companies’ valuation of their products and services (and correspondent impact on the P&L), ii) customer costs and perceived benefits, and iii) variable currency, with an implicit variable “exchange rate”, according to how strong is the fit between what one offers and other demands at a specific moment.\n\nPlace: relates to facilitation, to how convenient it is to consume products and services for a specific community that acts as the direct (connected with primary sales channels) and extended sellers (secondary markets, as the second-hand market, and marketing).\n\nPromotion: is linked to symbolization (brand related), the conversation held by the community (check “Place”) about products and services through different communication channels.\n\nIn summary: Customer Relationship Management (CRM) represents the set of tools and methods to be connected with clients and other stakeholders, to enhance strategy, marketing, and sales operations, analytics (data), and collaboration.',
    },
    2 : {
      'IC' : 'Innovative Co-creation|What products and other marketing-mix elements can I develop with my suppliers and partners?|Develop new products and services through regular interactions with your business ecosystem.\n\nAccording to Brodie, Hollebeek & Conduit, there are four levels of involvement of clients in the life of companies: i) Co-developing, for products and services; ii) Influencing, for rewarding (good delivery) or punishing (bad delivery) a company; iii) Augmenting when new uses for companies’ products and services are found and spread on forums; and Mobilising, when by social responsibility a brand is divinized or destroyed.\n\nNour defends that companies should co-create with nimbler (agile) firms and constantly scan the business environment via the following allies: friends, media, noticeable trends, customers, employees, and partners. Clients will be at the center of collective co-creation, surrounded by the other stakeholders’ contributions. Naturally, data (structured and unstructured) will assume a crucial role for the new comprehensive Chief Marketing Officer.\n\nInnovations on products and services should follow one of two strategies: i) differentiated – if clients get better solutions for their jobs to be done – or ii) disruptive – if, by charging less, companies win overserved clients (tired of products and services with an excess of non-used functionalities).\n\nIn summary: By using this lever, companies maintain their market relevance by systematizing the innovation of products and services (and correspondent processes), as well as their “Marketing”, by the active congregation with clients and other stakeholders.',
      'PP' : 'Pricing & Promotion|What pricing policy should I build? What sales promotions to develop? How to deal with “Free”?…|Maximize your revenue and profits by correctly pricing your online and offline sales.\n\nAn important message that Kennedy & Marrs conveys about price & promotions is that companies should be careful about discounts and free products, since, among other factors, they might focus clients on them and damage real loyalty, margins, and brands.\n\nApart from wild-guessing and multiple circumstantial tactics, the common ways to price products and services are those based on the following aspects: costs, industry standards, perceived exchanged value and return competition, and client’s profiles (and negotiation power).\n\nRegarding client profiles, Ramanujam & Tacke identify four segments of clients according to price sensitivity: i) “want price only” (the most price-sensitive); ii) “want it now”; iii) “want that product only”; and iv) “want the best” (the least price-sensitive).\n\nIn terms of dynamic (changeable) pricing, there are two major strategies: i) sequential skimming (high-to-low) – taking advantage of “early adopters” willing to pay by novelty – and ii) penetration (low-to-high) – by gaining market share via an initial low price strategy.\n\nIn summary: By using one of the different available pricing and promotion (in the sense of “price reduction”) strategies and tactics in the market, companies must find the right balance between quantities sold and profit making.',
      'CS' : 'Cross-selling & Revenue Sharing|How do I maximize my client’s share of wallet or average order with other product families?…|Make the most of a sale by using internal and external complementary products and services.\n\nThe major difference between cross-selling and revenue sharing is that the first is centered on one company and its products and services, while the second results from joint efforts of two or more companies to mutually share their client base and products and services.\n\nCross-selling & Revenue Sharing consists of increasing the basket sold to a client by adding related products. This relation can be obtained by complementarity (a motorcycle and a helmet or financing), bundle (a cable TV package or a “surprise box”), sequence (a discount on the next purchase), “genius” (suggested articles based on purchasing history), cross-promotions (mortgage interest rate bonifications), or impulse (items near or suggested by the cashier of a store).\n\nAffiliate Marketing can be considered a special case of revenue sharing. In this case, affiliates promote products and services of a certain merchant (for instance, via a link they share on the web), which in turn pays this affiliate (or agent) a success fee (or commission).\n\nIn summary: To increase their revenue, companies must maximize the value of related products and services sold to clients, including business generated via partnerships.',
      'SC' : 'Sales Conversion|How do I maximize the conversion of traffic in sales? What specific tactics & tools should I use?…|Maximize the transformation of traffic into sales, by using a set of appropriate tools.\n\nConversion of traffic into sales can have different forms: i) close rate (opportunity to sell vs sales), ii) value per sale (bigger basket), or iii) value of each client (bigger share of wallet).\n\nSales conversion is usually positively or negatively affected by the presence or absence, respectively, of several factors, such as 1-referrals, 2-social and 3-emotional connection, 4-customer experience, 5-fair price, 6-discounts, 7-convenience, 8-design, 9-transparency, 10-accessibility, 11-quality/reliability, 12-performance/functionality, 13-reliability, 14-options, 15-service, 16-staff professionalism, 17-warranties/guaranties, 18-speed, 19-bonuses, 20-availability, 21-financing … Each company must identify and post (on their walls or on their intranet) which of these attributes are crucial both to i) promote a sale (those that should always be present) and ii) to avoid a no-sale (those that should never be present).\n\nIn summary: When an occasion to sell is presented, companies must consistently increase clients’ purchasing basket and, in the long run, the share of wallet within their good clients.',
    },
    3 : {
      'CD' : 'Competences Development|What should I do to secure repeated business? How to find and develop my core competences?…|Develop your company’s competences as the best credential you can have for a referral.\n\nCompanies that develop their competences are centered on the following differentiations: i) what they do well and/or are the best in class, in terms of products and services; ii) continuous innovation (instead of just satisfying their clients, they positively surprise them); iii) specialized knowledge, methods, and tools (e.g.: the Bridgewhat 20 Levers of Growth); iv) intangible assets (check Building a Moat); v) effective organization and culture (culture eats strategy for breakfast).\n\nCore competences must always be performed in-house. The remaining competences can be delegated either partially (through partnerships and platforms: important but not core) or totally (through outsourcing or vendor relations: non-important and commoditized).\n\nIn summary: No company can continue to be relevant to clients, and positively referred by them if it does not nurture its core competences. Core competences are unique skills for which a company stands out in the market and builds a difficulty to imitate its’ value proposition.',
      'PM' : 'Platform Membership|How can I build my “community” via subscription models that maximize my lifetime value (LTV)?…|Take advantage of the complementary competences and endorsed reputation brought by prestigious platforms.\n\nIn the digital era, as companies and individuals migrate from ownership-Economy to membership-Economy, platforms become increasingly important as they perform three critical functions: i) curation (selection of content, suppliers, products, and services…); ii) engagement (to create collective intelligence, entertainment, sense of belonging…); iii) matching (through critical mass, analytics, recommendations…).\n\nPlatforms are built around i) physical goods (one-to-one); ii) services (one-to-one); iii) technology (one-to-many); and iv) network (many-to-many). Network platforms have two sides – buyers and sellers – that can produce both i) same-side effects and ii) cross-side effects.\n\nSame-side effects – the effects that buyers can have on other buyers and sellers in other sellers are of two types: positive, the more participants of your type you find on the platform, the more opportunities exist to partner, and negative, if the number of competitors is “too-much”.\n\nCross-side effects – the effects buyers have on sellers and sellers on buyers can also be positive and negative: positive, since the more buyers the sellers have, the larger their market will be (and vice-versa); and negative, when complexity and commercial harassment, due to a high proliferation of players, damages a market that becomes too little for too many (see Efficient Scale in the lever Building a Moat).\n\nIn summary: Although core competences should remain within a company, complementary and synergistic competences can be obtained via platforms. Additionally, and in terms of referrals, these platforms create a sort of quality seal and potential for endorsements for those that are integrated.',
      'RR' : 'Reputation & Referrals|How can I maximize my reputation via certifications, positive reviews, publishing… and referrals?…|Maximize positive advocacy for both your company and your products and services.\n\nReputation is intrinsically connected with referrals, except for bad reputation, which is a state to really avoid by, i) the correct use of the other 20LOG; ii) lawyers (which prevent or deal with states of bad reputation); and iii) Public Relations companies.\n\nLet’s focus our attention on referrals since these are the engine for a perpetual growth cycle around the 20LOG. The foundation of referrals is a good network and vice-versa. A good network incorporates what we call a give-me-five (GM5) growth mechanism: each close connection of a person or company should be able to endorse (by referral) five additional close connections. In turn, each of these referred connections must indicate the next five, and so on, following an exponential curve of qualified connections.\n\nUsually, the referrals process comprises the following process: i) Boost your referability (namely through the 20LOG) ii) Target a network niche (a “barrel”, instead of the open sea, where to congregate); iii) Upgrade your networking partners (e.g.: rely on growth-oriented and credible platforms, in which you will discover advisors, affiliates, advocates, and allies); iv) Develop a referral culture (supported by processes and tools that consistently foster the coming and going of testimonials and referrals); v) Create a reputation Scoring Board and make it visible to your market (including products and services reviews, certifications, testimonial, recommendations, and publications); vi) Convert your referrals into deals and deliver above expectations; vii) repeat this cycle.\n\nIn summary: A good reputation, usually managed with the help of Public Relations agencies (and lawyers), together with a permanent referral system based on good advocacy, are the catalysts of a permanent growth cycle.',
      'BD' : 'Brand Development|How do I replace “common” by “valuable and meaningful”, while forging strong ties with clients?…|Sell your products and services at a relatively higher price by leveraging your brand as an (intangible) asset.\n\nAccording to Davis, the eight metrics that can be used to measure brand development are the following: i) Knowledge (awareness, understanding, recall); ii) Positioning Understanding (by the different customer segments); iii) Contract Fulfilment (brands keep their promises); iv) Personality Recognition (not only the name, or the positioning, but also the values); v) Customer Acquisitions (brand based inbound sales); vi) Customer Retention and Loyalty (including churn metrics); vii) Penetration and Frequency (share-of-wallet due to brand based sales); viii) Value (Price-premiums that brands can command).\n\nMiller suggests that stories are good mechanisms to develop brand positioning. The elements of a Story-Brand are the following: i) A Character (the clients and their jobs to be done)… ii) Has a Problem (something that prevents clients to fulfil their needs)… iii) And Meets a Guide (someone that can help them, like a Sherpa in the mountains)… iv) Who Gives Them a Plan (a guide who has a plan)… v) And Calls Them to Action (direct: “buy now”; or transactional: promotions)… vi) That Helps Them to Avoid Failure (risk protection, guarantees)… vii) And Ends in Success (tell clients how you can change their lives; do not assume that they know how to do it).\n\nThis orientation towards clients, instead of “us”, is the backbone of the book Obvious Adams and is very well expressed in a sharp Adams question: “Mr. Merrit, to who are you advertising – paper-makers or paper-users?”\n\nIn summary: Each and every step of client engagement, and correspondent levers should embody the intrinsic value of a brand. In turn, this asset will maximize the value extracted from each stage, allowing companies to sell products at prices that will exceed those obtained for a commodity market.',
    },
  };

  Map<int,Map<String,String>> structure2 = {
    1 : {
      'MD' : 'Multichannel Development|How do I go digital? How can I create a seamless customer experience despite the channels?…|Take your business digital and find the channel that best matches your client experience.\n\nThe main types of multichannel sales consist of blending the following channels: online and brick-and-mortar, inside sales and field sales, direct and indirect channels, and inbound and outbound.\n\nOnline & Brick-and-Mortar: the major objective is to create a seamless experience for consumers while using complementary channels for marketing (e.g.: in-store mobile experience) and sales (e.g.: in-store customer returns of products acquired online).Inside Sales & Field Sales: for the long tail clients (the ones that buy small quantities) or first contacts, inside (at home or the office) sales acts as a complementary channel of the classic field sales – the ones managed by key accounts and reps in a more personalized manner.\n\nDirect & Indirect: very typical of sectors that use agents or dealers (insurance, food & beverage) indirect sales are the ones carried out by producers’ partners, while direct sales, that complement them, are the ones done by the producer’s sales force directly. Inbound & Outbound: inbound are the sales to clients that get in contact with the company (sometimes for service reasons), while outbound sales complement these by a proactive contact from the company to their clients.\n\nIn summary: Through this lever companies will address the different touchpoints of clients’ journeys, both from a sales and marketing point of view.',
      'SE' : 'Salesforce Effectiveness|How do I maximize client-facing time? How to drive and measure sales team conversion rates?…|Boost your salesforce productivity and effectiveness, by using the appropriate tools. Salesforce effectiveness deals with the proactive human contact with clients and the methods and tools (check CRM Marketing) to maximize productivity and effectiveness along the pipeline (different stages from lead to deal).\n\nThe most important evolution in the sales process was moving to a flow of activities around relationship-qualification-presentation-closing (with closing consuming almost half of the commercial process) to trust-needs-solutions-closing (with closing representing around 10% of the process). The Bridgewhat 4C’s: Credentials (reputation), Content (know-how), Connections (professional networking), and Counseling (strategic foresight) go in this direction.\n\nSales reps aim to transform a reactive and price-based relationship with their clients in which the companies are viewed as vendors/suppliers into one relationship in which companies are seen as partners/advisors. To foster this transformation, the sales team must be aware of the importance and impact of all the other LOG on their jobs and use them wisely and cooperatively.\n\nIn summary: This lever combines all the methods and tools that increase both client-facing time and the conversion ratio along the sales pipeline for the sales team.',
      'ME' : 'Market Entry|What new countries, segments, or channels should I pick? How to enter in these new “markets”?…|Explore new segments and enter new domestic and international markets.\n\nA crucial element for deciding to address a certain market is its dimension. If a market is not big enough to enable a company to achieve it’s sales objectives, either because the number of clients and their average spend is small, or the presence of competitors is intense, it is time to enter other territories: market segments or regions.\n\nAmong other factors, as the PESTLE (Political, Economic, Social, Technological, Legal and Environmental factors), three fundamental metrics to define market attractiveness refer to TAM, SAM and SOM.\n\nTAM (Total Available Market): is total demand for a product or service. On the B2B space can be obtained by the sum of different possible buyers found via NACE codes:\n\nSAM (Service Available Market): are the segments that can be addressed by a specific product or service, have in mind its positioning and targeting. SOM (Serviceable Obtainable Market): are the market share that a company is able to capture on the SAM.\n\nIn summary: By entering in new market segments and regions, companies can capture new clients and diversify from markets that are “exhausted”.',
      'MP' : 'M&A & Partnerships|What companies can I buy to conquer new markets? How do I strengthen my value network?…|Capture a new customer base both by acquisition and partnerships (enablers of revenue sharing).\n\nApart from the perspective of better management, when a company acquires another company, usually it can count on two sources of strategic advantage: increase its client base, reduce costs, and complement core competencies.\n\nCapture Clients: companies not only increase their TAM, SAM, or SOM (check Market Entry) but also reduce competition (check Building a Moat).\n\nCosts Saving: by eliminating redundancies and increasing their relative power through scale, companies may benefit from cost reductions that bring more room for price competitiveness.\n\nCore-Competences: the merged companies will increase their core competence by using their highest common denominator in terms of Marketing, HR, Production…\n\nIf for financial reasons or others, companies prefer the collaboration resulting from a joint venture (contractual) instead of an M&A, they can still envisage the same type of benefits of the former, depending on the fit of their vision, culture, and strategy, and the level of mutual-dependency, trust, and communication.\n\nIn summary: another alternative to capture clients, besides organic growth, is to buy companies and their correspondent client bases or just to share these via partnerships (and consequent revenue-sharing).',
    },
    2 : {
      'CC' : 'Client Centricity|How do I increase client engagement? How do I extend and customize products around clients?…|Synchronize your organization around clients, with a special focus on customer experience.\n\nKates & Galbraith developed a method that measures the level of client-centricity for a company based on the level of integration (with client’s companies) of products and services. The scale has five stages: i) stand-alone products (low integration), ii) bundled products, iii) packages, iv) connected systems, and v) integral systems (high integration).\n\nOn the clients’ side, expectations about their importance to a company are usually translated into access to multiple, complex, and customized products and services; pre-sales advice, and post-sales service; alongside a customized and regular assessment of customer needs, after a deep understanding of the job to be done. Customer-centric companies focus on solutions rather than just products and services; client performance rather than just functionality; and CRM rather than just product development.\n\nFinally, in what relates to client engagement, and according to Gould & Pine II, the level of proximity and integration between buyers and sellers follows three stages: scatter, gather, and matter.\n\nScatter: at this stage clients communicate with and about their suppliers, with the main focus on messages and their spreadability.\n\nGather: here, clients co-create with their suppliers, maximizing time spent together and taking advantage of idea creation and their shareability.\n\nMatter: is the highest stage of engagement, in which the client and supplier (partner) belong to the same platform or value network. The focus now is on the scalability of their partnership.\n\nIn summary: A client-centric company puts the client at the heart of all it does. In this context, it is natural that the corporate culture of such companies embeds priorities like user-experience (UX) or customer success activities.',
      'LI' : 'Loyalty Increase|How do I satisfy my clients forever? What are the most effective loyalty programs and incentives?…|Maximize clients’ lifetime value, by constantly delivering above market expectations.\n\nLoyalty implies a positive bias favoring good clients. According to Marketing Guy, there are four major groups of loyalty programs: i) Membership (discounts for members); ii) Rewards (free products by purchase); iii) Points (members accumulate points, based on their purchasing history); and iv) Segments (benefits by client’s segment).\n\nThe benefits given to clients can assume different forms: i) Discounts (pecuniary benefits, like price reductions); ii) Free (more products or services); iii) Client-Experience (convenience, VIP, channels, speed…); iv) Partnerships (cross-benefits among different companies); and v) Affinity (partnerships, based on client-centricity – check lever Client-Centricity).\n\nSince loyalty increase presents several benefits for companies (naturally, including saving money in costs of acquiring clients), their main objective is to move clients from disengaged – ready to switch companies imminently – to highly engaged – with high emotional attachment and positive advocacy, which leads to free marketing “campaigns”.\n\nIn summary: Once a company decides to be client-centric, it is natural that it translates this decision into recurrent benefits for their clients, found, for instance, around extra-value on one of the classic Kotler’s 4 P.',
      'CR' : 'Churn Reduction|How do I avoid decreasing my share of wallet in a customer or losing it? What signs should I read?…|Minimize the loss of clients or revenue due to frustrations regarding products and services or experiences.\n\nThere are several ways to lose customers: i) lack of attention to and investment in current clients (Sales & Marketing usually spend their time and money chasing new clients); ii) lack of alerts for clients that are about to be lost (gradually); iii) unrecognized or unsolved mistakes (which lead to abrupt departures); iv) absence of client recovery processes; v) non-existence of a permanent referrals system (a denial to give a referral will also be considered as an alert about a client’s satisfaction).\n\nSteinman identifies 10 signs of customer health (that once not verified are sources of churn): i) Product Adoption; ii) (Use of) Customer Support; iii) (Good) Survey Scores; iv) (High) Marketing Engagement; v) (High) Community Involvement; vi) Marketing Participation (Referrals, Events…); vii) (Zero) Contract Growth, viii) (High) Self-Sufficiency; ix) (Punctual) Invoice History; x) Executive Relationship (client’s importance).\n\nWhen complaints arise, some rules must be followed: i) assume the problem and apologize; ii) do not criticize or mistrust the customer; iii) solve the problem quickly and exceed expectations (so after the solution the customer is even more satisfied than before the problem arose); iv) undertake a root cause analysis and solve the problem for good.\n\nIn summary: Although it is impossible for a company to not make any mistakes with their clients, i) these mistakes should be avoided, aiming at a zero-defect culture, and ii) once they surge, quickly and, preferably, definitely fixed (without any prejudice towards assuming flaws).',
      'BM' : 'Building a Moat|What can I build – quality, client’s performance, convenience – that my competitors cannot copy?…|Create the most effective defenses against competitors, by using sectorial competitive advantages.\n\nThe term “Moat” has been spread in the Capital Markets by Warren Buffet and later adopted by Morningstar, whose research identified five sources of competitive advantage (moats that protect the castles, i.e. the companies): i) cost advantage; ii) intangible assets; iii) switching costs; iv) efficient scale, and v) network effect.\n\nCost Advantage: companies can make price wars and still keep their profitability (e.g.: UPS-FedEx).\n\nIntangible Assets: firms that protect themselves with brands, patents, and public licenses (e.g.: pharmaceuticals, Coca-Cola). Switching Costs: firms that bet on customers’ high inconvenience to change suppliers (e.g.: mortgages’, banks).\n\nEfficient Scale: one or two companies acting profitability in one market of limited size (e.g.: pipelines, airports).\n\nNetwork Effect: platforms in which participants mutually benefit from others’ growth (e.g.: Apple Store, Amazon).\n\nIn summary: Clients have the tendency to stick with a company that treats them well. Notwithstanding, it helps client retention to reduce their perceived alternatives by always maintaining an active value proposition that creates barriers to entry for competitors.',
    },
  };

  Map<String,bool> openText = {};

  @override
  void initState() {
    super.initState();
    structure1.forEach((key, value) { value.forEach((key, value) { openText[key] = false; }); });
    structure2.forEach((key, value) { value.forEach((key, value) { openText[key] = false; }); });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              headerShared(context: context,color: AcademyColors.colorsLeversObscure,scaffoldKey: scaffoldKey,viewSca: false),
              Expanded(
                child: SizedBox(
                  width: sizeW,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                          child: bannerTitle(type: 6)
                      ),
                      SizedBox(height: sizeH * 0.04),
                      Expanded(
                        child: cardContainer(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      )
    );
  }

  Widget cardContainer(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BounceInUp(
            duration: const Duration(milliseconds: 1200),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              width: sizeH * 0.35,
              height: sizeH * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/image/logo_levers_animation.GIF').image,
                    fit: BoxFit.fitWidth
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06, vertical: sizeH * 0.02),
            child: Text(title1,style: AcademyStyles().styleLato(size: sizeH * 0.02,color: AcademyColors.colors_1B4570)),
          ),
          container1(num: '1',title: 'ATRACTION', data: structure1[1]!),
          container2(num: '2',title: 'ACQUISITION', data: structure2[1]!),
          container1(num: '3',title: 'ARPU', data: structure1[2]!),
          container2(num: '4',title: 'RETENTION', data: structure2[2]!),
          container1(num: '5',title: 'REFERRALS', data: structure1[3]!),
        ],
      ),
    );
  }

  Widget container1({required String num, required title , required Map<String,String> data}){

    List<Widget> listW = [];
    bool isPar = false;
    data.forEach((key, value) {
      listW.add(cardDataST(
        title: key,
        title2: value.split('|')[0],
        subTitle: value.split('|')[1],
        subTitle2: value.split('|')[2],
        color: isPar ? Colors.transparent : AcademyColors.colorsLeversCeleste,
      ));
      isPar = !isPar;
    });


    return Container(
      width: sizeW,
      padding: const EdgeInsets.all(20),
      color: AcademyColors.colorsLeversObscure,
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: sizeH * 0.025,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Text(num,style: AcademyStyles().styleLato(
                        color: AcademyColors.colorsLeversObscure,size: sizeH * 0.025
                    )),
                  ),
                ),
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container(
                    constraints: BoxConstraints(minWidth: sizeW * 0.3, maxWidth: sizeW * 0.5),
                    child: Text(title,textAlign: TextAlign.center,style: AcademyStyles().stylePoppins(
                        size: sizeH * 0.022,color: Colors.white,fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          SizedBox(
            width: sizeW,
            child: Column(
              children: listW,
            ),
          ),
        ],
      ),
    );
  }

  Widget container2({required String num, required title , required Map<String,String> data}){

    List<Widget> listW = [];
    bool isPar = false;
    data.forEach((key, value) {
      listW.add(cardDataST(
        title: key,
        title2: value.split('|')[0],
        subTitle: value.split('|')[1],
        subTitle2: value.split('|')[2],
        color: isPar ? AcademyColors.colorsLeversObscure : AcademyColors.colorsLeversCeleste,
      ));
      isPar = !isPar;
    });


    return Container(
      width: sizeW,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AcademyColors.colorsLeversObscure,
                  radius: sizeH * 0.025,
                  child: CircleAvatar(
                    radius: sizeH * 0.02,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text(num,style: AcademyStyles().styleLato(
                          color: AcademyColors.colorsLeversObscure,size: sizeH * 0.025
                      )),
                    ),
                  ),
                ),
                SizedBox(width: sizeW * 0.01,),
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container(
                    constraints: BoxConstraints(minWidth: sizeW * 0.3, maxWidth: sizeW * 0.5),
                    child: Text(title,textAlign: TextAlign.center,style: AcademyStyles().stylePoppins(
                        size: sizeH * 0.022,color: AcademyColors.colorsLeversObscure,fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          SizedBox(
            width: sizeW,
            child: Column(
              children: listW,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardDataST({required String title, required String title2, required String subTitle, required Color color, required String subTitle2}){
    return InkWell(
      onTap: (){
        bool valueOld = !openText[title]!;
        structure1.forEach((key, value) { value.forEach((key, value) { openText[key] = false; }); });
        structure2.forEach((key, value) { value.forEach((key, value) { openText[key] = false; }); });
        openText[title] = valueOld;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
        padding: EdgeInsets.symmetric(vertical: sizeH * 0.015),
        color: color,
        child: Row(
          children: [
            SizedBox(
              width: sizeW * 0.25,
              child: Center(
                child: Text(title,style: AcademyStyles().stylePoppins(
                  size: sizeH * 0.025,color: Colors.white
                )),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title2,style: AcademyStyles().stylePoppins(
                      size: sizeH * 0.018,color: Colors.white
                  )),
                  Text(subTitle,style: AcademyStyles().stylePoppins(
                      size: sizeH * 0.015,color: Colors.white
                  )),
                  !openText[title]! ? Container() :
                  Text(subTitle2,style: AcademyStyles().stylePoppins(
                      size: sizeH * 0.015,color: Colors.white
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

