import 'package:academybw/services/shared_preferences.dart';
import 'package:flutter/material.dart';

String numberFormat(double x) {
  List<String> parts = x.toString().split('.');
  RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');
  parts[0] = parts[0].replaceAll(re, '.');
  return parts.join(',');
}

Map<int,String> mapABC = {
  1 : 'A',
  2 : 'B',
  3 : 'C',
  4 : 'D',
  5 : 'E',
  6 : 'F',
  7 : 'G',
  8 : 'H',
  9 : 'I',
  10 : 'J',
  11 : 'K',
  12 : 'L',
  13 : 'M',
  14 : 'N',
  15 : 'Ñ',
  16 : 'O',
  17 : 'P',
  18 : 'Q',
  19 : 'R',
  20 : 'S',
  21 : 'T',
  22 : 'U',
  23 : 'V',
  24 : 'W',
  25 : 'X',
  26 : 'Y',
  27 : 'Z',
};

String getToken(){
  return 'Bearer ${SharedPreferencesLocal.prefs.getString('AcademyToken') ?? ''}';
}

List<Color> colorsListQuestionUnion = [
  const Color(0xF0A6061A),
  Colors.cyan,
  const Color(0xF095C4E9),
  Colors.amber,
  Colors.teal,
  Colors.green,
  const Color(0xF0958E6F),
  Colors.deepPurpleAccent,
  Colors.lightBlue,
  const Color(0xF0E1E1E1),
  const Color(0xF0958E6F),
];

enum TypeQuestion {simple,multi,union,order}

const String urlImgCartoons = 'https://bridgewhat.ole.agency/backend/storage/cartoons/';

List<Map<String,dynamic>> getListQuestionQuiz () => [
  {
    'id' : 1,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 2,
    'header' : 'Introductory',
    'title' : 'How many levers exist for each of the stages of the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '4',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 3,
    'header' : 'Introductory',
    'title' : 'What are the Five Stages of Client Engagement?',
    'questions' : [
      'Attention, Acquisition, ARPU, Retention, Repurchase','Attention, Activation, ARPU, Retention, Referrals','Attraction, Acquisition, ARPU, Retention, Referrals','Attraction, Activation, ARPU, Retention, Repurchase'
    ],
    'result' : 'Attraction, Acquisition, ARPU, Retention, Referrals',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 4,
    'header' : 'Introductory',
    'title' : 'What is a close correspondence between each of the Five Stages of Client Engagement?',
    'questions' : [
      ['Attraction','Retention','Referrals','ARPU','Acquisition'],
      ['Revenue','Advocacy','Attention','Loyalty','Activation'],
    ],
    'result' : ['Attraction / Attention','Retention / Loyalty','Referrals / Advocacy','ARPU / Revenue','Acquisition / Activation'],
    'answered' : [
      ['Attraction','Retention','Referrals','ARPU','Acquisition'],
      ['Revenue','Advocacy','Attention','Loyalty','Activation'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 5,
    'header' : 'Introductory',
    'title' : 'What does ARPU stands for?',
    'questions' : [
      'Awsome Results per User','Average Results per Unit','Average Revenue per User','Average Results per User'
    ],
    'result' : 'Average Revenue per User',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 6,
    'header' : 'The BridgeWhat 20 Levers of Growth',
    'title' : 'What levers belong to Attraction?',
    'questions' : [
      'CRM Marketing','Multichannel Development','Positioning & Targeting','Client-Centricity','Digital Marketing','Innovative Co-Creation','Traffic Generation','Competences Development',
    ],
    'result' : 'CRM Marketing|Positioning & Targeting|Digital Marketing|Traffic Generation|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 7,
    'header' : 'The BridgeWhat 20 Levers of Growth',
    'title' : 'WWhat levers belong to Acquisition?',
    'questions' : [
      'Pricing & Promotion','Market Entry','M&A & Partnerships','Salesforce Effectiveness','Loyalty Increase','Platform Membership','Multichannel Development','Digital Marketing'
    ],
    'result' : 'Market Entry|M&A & Partnerships|Salesforce Effectiveness|Multichannel Development|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 8,
    'header' : 'The BridgeWhat 20 Levers of Growth',
    'title' : 'What levers belong to ARPU?',
    'questions' : [
      'Sales Conversion','Churn Reduction','Market Entry','Innovative Co-Creation','Pricing & Promotion','Traffic Generation','Reputation & Referrals','Cross-Selling & Revenue Sharing',
    ],
    'result' : 'Sales Conversion|Innovative Co-Creation|Pricing & Promotion|Cross-Selling & Revenue Sharing|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 9,
    'header' : 'The BridgeWhat 20 Levers of Growth',
    'title' : 'What levers belong to Retention?',
    'questions' : [
      'Brand Development','Loyalty Increase','CRM Marketing','Churn Reduction','Client-Centricity','M&A & Partnerships','Sales Conversion','Building a Moat',
    ],
    'result' : 'Loyalty Increase|Churn Reduction|Client-Centricity|Building a Moat|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 10,
    'header' : 'The BridgeWhat 20 Levers of Growth',
    'title' : 'What levers belong to Referrals?',
    'questions' : [
      'Traffic Generation','Platform Membership','Salesforce Effectiveness','Reputation & Referrals','Competences Development','Cross-Selling & Revenue Sharing','Building a Moat','Brand Development',
    ],
    'result' : 'Platform Membership|Reputation & Referrals|Competences Development|Brand Development|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 11,
    'header' : '1. Positioning & Targeting',
    'title' : 'What is the Job To Be Done?',
    'questions' : [
      "Solutions to respond to clients' needs","Clients' desired outcomes","Client's needs",'What clients try to accomplish',
    ],
    'result' : 'What clients try to accomplish',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 12,
    'header' : '1. Positioning & Targeting',
    'title' : 'What is the best definition for positioning in the context of Jobs To Be Done?',
    'questions' : [
      "Address under-served markets for desired outcomes with related solutions","Address over-served markets for desired outcomes with cheaper solutions","Address over-served markets for desired outcomes with better solutions",'Address under-served markets for desired outcomes with unrelated solutions',
    ],
    'result' : 'Address under-served markets for desired outcomes with related solutions',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 13,
    'header' : '2. Digital Marketing',
    'title' : 'What SEO stands for?',
    'questions' : [
      'Search Elemental Organization','Search Engine Optimization','Structured Exploration Online','Structured Engine Online'
    ],
    'result' : 'Search Engine Optimization',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 14,
    'header' : '2. Digital Marketing',
    'title' : 'What is the correct sequence of sales stories (to be told on the web)?',
    'questions' : [
      'Land - Fight - Hook','Fight - Hook - Land','Hook - Fight - Land','Fight - Land - Hook','Hook - Land - Fight','Land - Hook - Fight'
    ],
    'result' : 'Hook - Fight - Land',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 15,
    'header' : '3. Traffic Generation',
    'title' : 'What is the state of cold, tepid and hot lead?',
    'questions' : [
      ['Not aware of a need','Looking for a solution','Aware, but not looking for a solution'],
      ['Hot','Cold','Tepid'],
    ],
    'result' : ['Not aware of a need / Cold','Looking for a solution / Hot','Aware, but not looking for a solution / Tepid'],
    'answered' : [
      ['Not aware of a need','Looking for a solution','Aware, but not looking for a solution'],
      ['Hot','Cold','Tepid'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 16,
    'header' : '3. Traffic Generation',
    'title' : 'What is the correct sequence of traffic web funnels?',
    'questions' : [
      'Presentation - Phone - Lead - Unboxing','Phone - Presentation - Lead - Unboxing','Lead - Unboxing - Presentation - Phone','Unboxing - Phone - Presentation - Lead','Lead - Phone - Presentation - Unboxing'
    ],
    'result' : 'Lead - Unboxing - Presentation - Phone',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 17,
    'header' : '4. CRM Marketing',
    'title' : 'What are the most used types of CRM?',
    'questions' : [
      'Advertising','Strategic','Network','Optimization','Operational','Technical','Collaborative','Analytic','Online'
    ],
    'result' : 'Strategic|Operational|Collaborative|Analytic|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 18,
    'header' : '4. CRM Marketing',
    'title' : 'What is the correspondence between Kotler\'s 4 P and similar concepts?',
    'questions' : [
      ['Product','Price','Place','Promotion'],
      ['Symbolization','Configuration','Facilitation','Valuation'],
      ['Conversation','Customer Costs','Co-Creation','Convenient'],
      ['Communication','Community','Currency','Customer Value'],
    ],
    'result' : [
      'Product / Configuration / Co-Creation / Customer Value',
      'Price / Valuation / Customer Costs / Currency',
      'Place / Facilitation / Convenient / Community',
      'Promotion / Symbolization / Conversation / Communication',
    ],
    'answered' : [
      ['Product','Price','Place','Promotion'],
      ['Symbolization','Configuration','Facilitation','Valuation'],
      ['Conversation','Customer Costs','Co-Creation','Convenient'],
      ['Communication','Community','Currency','Customer Value'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 19,
    'header' : '5. Multichannel Development',
    'title' : 'Multichannel Development relates to...',
    'questions' : [
      'Marketing','Sales','Marketing & Sales','None of the above'
    ],
    'result' : 'Marketing & Sales',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 20,
    'header' : '5. Multichannel Development',
    'title' : 'Please connect the complementary channels...',
    'questions' : [
      ['Online','Inside Sales','Direct','Inbound'],
      ['Outbound','Indirect','Brick-and-Mortar','Field Sales'],
    ],
    'result' : ['Online / Brick-and-Mortar','Inside Sales / Field Sales','Direct / Indirect','Inbound / Outbound'],
    'answered' : [
      ['Online','Inside Sales','Direct','Inbound'],
      ['Outbound','Indirect','Brick-and-Mortar','Field Sales'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 21,
    'header' : '6. Salesforce Effectiveness',
    'title' : 'What is the meaning of "Pipeline" linked to the Bridgewhat 20 Levers of Growth?',
    'questions' : [
      'Pipe for oil & gas transport','Repository of Leads and Deals','Computacional technique','Sales channel'
    ],
    'result' : 'Repository of Leads and Deals',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 22,
    'header' : '6. Salesforce Effectiveness',
    'title' : 'What are the BridgeWhat 4 C?',
    'questions' : [
      'Credibility - Content - Connections - Couselling','Credentials - Capacity - Contacts - Couselling','Credibility - Capacity - Connections - Consultancy','Credibility - Content - Connections - Consulting','Credentials - Content - Contacts - Couselling','Credentials - Content - Connections - Couselling',
    ],
    'result' : 'Credentials - Content - Connections - Couselling',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 23,
    'header' : '7. Market Entry',
    'title' : 'Market Entry relates to...',
    'questions' : [
      'Regions','Market Segments','Regions or Market Segments','None of the above'
    ],
    'result' : 'Regions or Market Segments',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 24,
    'header' : '7. Market Entry',
    'title' : 'What is the relative dimension of the following markets...',
    'questions' : [
      ['TAM','SAM','SOM'],
      ['The smallest','The biggest','In between'],
    ],
    'result' : ['TAM / The biggest','SAM / In between','SOM / The smallest',],
    'answered' : [
      ['TAM','SAM','SOM'],
      ['The smallest','The biggest','In between'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 25,
    'header' : '8. M&A & Partnerships',
    'title' : 'What is the central element of the following concepts...',
    'questions' : [
      ['M&A','Partnership'],
      ['Contract','Equity'],
    ],
    'result' : ['M&A / Equity','Partnership / Contract',],
    'answered' : [
      ['M&A','Partnership'],
      ['Contract','Equity'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 26,
    'header' : '8. M&A & Partnerships',
    'title' : 'What\'s the main reasons for M&A & Partnerships?',
    'questions' : [
      'Better Management - Capture Clients - Cost Savings - Core-Competences','Capture Clients - Cost Savings','Capture Clients - Cost Savings - Core-Competences','Capture Clients'
    ],
    'result' : 'Better Management - Capture Clients - Cost Savings - Core-Competences',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 27,
    'header' : '9. Innovative Co-Creation',
    'title' : 'What entities are suposed to participate in the co-creation process?',
    'questions' : [
      'Clients','Employees','Suppliers','Stakeholders'
    ],
    'result' : 'Stakeholders',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 28,
    'header' : '9. Innovative Co-Creation',
    'title' : 'What entities are suposed to participate in the co-creation process?',
    'questions' : [
      'Disruption','Divergency','Discount','Differentiation'
    ],
    'result' : 'Disruption|Differentiation|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 29,
    'header' : '10. Pricing & Promotion',
    'title' : 'Among those, what is the less interesting criterion for pricing?',
    'questions' : [
      'Costs','Industry standards','Historic prices','Client\'s Value (or Return)','Competition\'s prices','Client\'s profile (e.g.: relative negotiation prices)'
    ],
    'result' : 'Historic prices',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 30,
    'header' : '10. Pricing & Promotion',
    'title' : 'Please rank from the most to the least price sensitive...',
    'questions' : ['"Want Price only"','"Want it Now"','"Want That product only"','"Want the Best"'],
    'result' : ['"Want the Best"','"Want Price only"','"Want it Now"','"Want That product only"'],
    'answered' : ['"Want Price only"','"Want it Now"','"Want That product only"','"Want the Best"'],
    'type' : TypeQuestion.order,
  },
  {
    'id' : 31,
    'header' : '11. Cross-Selling & Revenue Sharing',
    'title' : 'What is the central entity in Cross-Selling vs Revenue Sharing?',
    'questions' : [
      ['Revenue Sharing','Cross-Selling'],
      ['Own Company','Partnership'],
    ],
    'result' : ['Revenue Sharing / Partnership','Cross-Selling / Own Company',],
    'answered' : [
      ['Revenue Sharing','Cross-Selling'],
      ['Own Company','Partnership'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 32,
    'header' : '11. Cross-Selling & Revenue Sharing',
    'title' : 'How can products and services relate in Cross-Selling and Revenue Sharing?',
    'questions' : [
      'Complementarity','Exclusive','Sequence (next purchase)','Bundle (package)','"Genius" (suggestions)','Direct Discount','Cross-Promotions','Freemium','Impulse'
    ],
    'result' : 'Complementarity|Sequence (next purchase)|Bundle (package)|"Genius" (suggestions)|Cross-Promotions|Impulse|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 33,
    'header' : '12. Sales Conversion',
    'title' : 'What are the three mentioned forms of sales conversion?',
    'questions' : [
      'Total sales','Close rate','Value per sale','Market share','Sales margin','Share-of-wallet',
    ],
    'result' : 'Close rate|Value per sale|Share-of-wallet|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 34,
    'header' : '12. Sales Conversion',
    'title' : 'What are the three mentioned forms of sales conversion?',
    'questions' : [
      'Referrals','Social and Emotional connection','Customer Experience','Price','Discounts','Convenience','Design','Transparency','Accessibility','Quality','Performance/Functionality','Reliability','Options','Service','Staff professionalism','Warranties/Guaranties','Speed','Bonuses','Availability','Financing',
    ],
    'result' : 'Referrals|Social and Emotional connection|Customer Experience|Price|Discounts|Convenience|Design|Transparency|Accessibility|Quality|Performance/Functionality|Reliability|Options|Service|Staff professionalism|Warranties/Guaranties|Speed|Bonuses|Availability|Financing|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 35,
    'header' : '13. Client-Centricity',
    'title' : 'Please rank from the most to the least client-centric product or service:',
    'questions' : ['Stand-alone products','Bundled products','(Established) Package','Connected systems','Integral system',],
    'result' : ['(Established) Package','Bundled products','Integral system','Stand-alone products','Connected systems',],
    'answered' : ['Stand-alone products','Bundled products','(Established) Package','Connected systems','Integral system',],
    'type' : TypeQuestion.order,
  },
  {
    'id' : 36,
    'header' : '13. Client-Centricity',
    'title' : 'What is the correspondence among the different levels of clients\' engagement?',
    'questions' : [
      ['Scatter','Gather','Matter'],
      ['Co-Creation','Communication','Partnership'],
      ['Scalability','Spreadability','Shareability'],
    ],
    'result' : [
      'Scatter / Communication / Spreadability',
      'Gather / Co-Creation / Shareability',
      'Matter / Partnership / Scalability',
    ],
    'answered' : [
      ['Scatter','Gather','Matter'],
      ['Co-Creation','Communication','Partnership'],
      ['Scalability','Spreadability','Shareability'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 37,
    'header' : '14. Loyalty Increase',
    'title' : 'Please chose the most correct correspondence:',
    'questions' : [
      ['Membership','Rewards','Points','Segments'],
      ['Free products by purchase','Benefits by segment','Discounts for members','Purchasing history',],
    ],
    'result' : ['Membership / Discounts for members','Rewards / Free products by purchase','Points / Purchasing history','Segments / Benefits by segment',],
    'answered' : [
      ['Membership','Rewards','Points','Segments'],
      ['Free products by purchase','Benefits by segment','Discounts for members','Purchasing history',],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 38,
    'header' : '14. Loyalty Increase',
    'title' : 'Please chose the most correct correspondence for the different types of benefits to produce loyalty:',
    'questions' : [
      ['Discounts','Free','Client-Experience','External Benefits','Affinity'],
      ['Cross-benefits from third party','Pecuniary benefits','Products or services offers','Partnerships based on client-centricity','Convenience, VIP...'],
    ],
    'result' : ['Discounts / Pecuniary benefits','Free / Products or services offers','Client-Experience / Convenience, VIP...','External Benefits / Cross-benefits from third party','Affinity / Partnerships based on client-centricity',],
    'answered' : [
      ['Discounts','Free','Client-Experience','External Benefits','Affinity'],
      ['Cross-benefits from third party','Pecuniary benefits','Products or services offers','Partnerships based on client-centricity','Convenience, VIP...'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 39,
    'header' : '15. Churn Reduction',
    'title' : 'Please identify signs of customer health:',
    'questions' : [
      'Product adoption','Use of customer support','Good survey scores','High Marketing engagement','High community involvement','Marketing particpation (referrals, events...)','Zero contract growth','High self-suficiency','Puntual invoice history','Executive relationship (client\'s importance)'
    ],
    'result' : 'Product adoption|Use of customer support|Good survey scores|High Marketing engagement|High community involvement|Marketing particpation (referrals, events...)|Zero contract growth|High self-suficiency|Puntual invoice history|Executive relationship (client\'s importance)|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 40,
    'header' : '15. Churn Reduction',
    'title' : 'Please identify "rules" for dealing with complaints:',
    'questions' : [
      'Assume the problem','Apologise','Invlove lawyers immediatly','Do not criticise the client','Do not mistrust the client','Say "the client is always right"','Solve the problem quickly','Exceed expectations on problem solving','Undertake a root cause analyisis for the problem','solve the problem for good'
    ],
    'result' : 'Assume the problem|Apologise|Do not criticise the client|Do not mistrust the client|Solve the problem quickly|Exceed expectations on problem solving|Undertake a root cause analyisis for the problem|solve the problem for good|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 41,
    'header' : '16. Building a Moat',
    'title' : 'What are the main sources of moats according to Morningstar?',
    'questions' : [
      'Better Management','Partnerships','Efficient Scale','Network Effects','Better Quality','Cost Advantage','Intangible Assets','Better Products','Core Competences','Switching Costs',
    ],
    'result' : 'Efficient Scale|Network Effects|Cost Advantage|Intangible Assets|Switching Costs|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 42,
    'header' : '16. Building a Moat',
    'title' : 'Make the correct associations for the different sources of moats:',
    'questions' : [
      ['Cost Advantage','Intangible Assets','Switching Costs','Efficient Scale','Network Effect'],
      ['One or two companies acting profitability in one market of limited size (e.g.: pipelines, airports).','Companies can make price wars and still keep their profitability (e.g.: UPS-FedEx).','Firms that bet on customer’s high inconvenience to change suppliers (e.g.: mortgages’, banks).','Platforms in which participants mutually benefit from others’ growth (e.g.: Apple Store, Amazon).','Firms that protect themselves with brands, patents and public licenses (e.g.: pharmaceuticals, Coca-Cola).'],
    ],
    'result' :[ 'Cost Advantage / Companies can make price wars and still keep their profitability (e.g.: UPS-FedEx).','Intangible Assets / Firms that protect themselves with brands, patents and public licenses (e.g.: pharmaceuticals, Coca-Cola).','Switching Costs / Firms that bet on customer’s high inconvenience to change suppliers (e.g.: mortgages’, banks).','Efficient Scale / One or two companies acting profitability in one market of limited size (e.g.: pipelines, airports).','Network Effect / Platforms in which participants mutually benefit from others’ growth (e.g.: Apple Store, Amazon).', ],
    'answered' : [
      ['Cost Advantage','Intangible Assets','Switching Costs','Efficient Scale','Network Effect'],
      ['One or two companies acting profitability in one market of limited size (e.g.: pipelines, airports).','Companies can make price wars and still keep their profitability (e.g.: UPS-FedEx).','Firms that bet on customer’s high inconvenience to change suppliers (e.g.: mortgages’, banks).','Platforms in which participants mutually benefit from others’ growth (e.g.: Apple Store, Amazon).','Firms that protect themselves with brands, patents and public licenses (e.g.: pharmaceuticals, Coca-Cola).'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 43,
    'header' : '17. Competences Development',
    'title' : 'Among these statments, please chose the ones that correspond to potential Core Competences',
    'questions' : [
      'What they do well and/or are the best in class, in terms of products and services.','Continuous innovation (instead of just satisfying their clients, they positively surprise them).','Specialized knowledge, methods and tools (e.g.: the Bridgewhat 20 Levers of Growth)','Intangible assets (check Building a Moat).','Effective organization and culture (culture eats strategy for breakfast).'
    ],
    'result' : 'What they do well and/or are the best in class, in terms of products and services.|Continuous innovation (instead of just satisfying their clients, they positively surprise them).|Specialized knowledge, methods and tools (e.g.: the Bridgewhat 20 Levers of Growth)|Intangible assets (check Building a Moat).|Effective organization and culture (culture eats strategy for breakfast).|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 44,
    'header' : '17. Competences Development',
    'title' : 'Please chose your make-or-buy for competences:',
    'questions' : [
      ['Core-competences','Important but not core','Not Important and commoditized'],
      ['Outsorced or Vendor-relations','Partnerships or Platforms','In-House'],
    ],
    'result' : ['Core-competences / In-House','Important but not core / Partnerships or Platforms','Not Important and commoditized / Outsorced or Vendor-relations'],
    'answered' : [
      ['Core-competences','Important but not core','Not Important and commoditized'],
      ['Outsorced or Vendor-relations','Partnerships or Platforms','In-House'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 45,
    'header' : '18. Platform Membership',
    'title' : 'What platforms\' functions are mentioned in the course?',
    'questions' : [
      'Curation (selection of content, suppliers, products and services…).','Engagement (to create collective intelligence, entertainment, sense of belonging…).','Transaction (including Request For Proposals/auctions and vendor & contract management...).','Matching (through critical mass, analytics, recommendations…).'
    ],
    'result' : 'Curation (selection of content, suppliers, products and services…).|Engagement (to create collective intelligence, entertainment, sense of belonging…).|Matching (through critical mass, analytics, recommendations…).|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 46,
    'header' : '18. Platform Membership',
    'title' : 'Make the correspondence among the different types of platforms and the type of supplier-client relationship:',
    'questions' : [
      ['Physical Goods','Services','Technology','Network'],
      ['One-to-Many','One-to-One','Many-to-Many','One-to-One#'],
    ],
    'result' : ['Physical Goods / One-to-One','Services / One-to-One#','Technology / One-to-Many','Network / Many-to-Many'],
    'answered' : [
      ['Physical Goods','Services','Technology','Network'],
      ['One-to-Many','One-to-One','Many-to-Many','One-to-One#'],
    ],
    'type' : TypeQuestion.union,
  },
  {
    'id' : 47,
    'header' : '19. reputation & referrals',
    'title' : 'What is "Give-Me-Five" (GM5) in the context of BridgeWhat?',
    'questions' : [
      'A greeting','A sales mechanism that charges 5% comission','A referral mechanism by which (our) 5 close contacts endorse to (their) 5 close contacts','A TV Show'
    ],
    'result' : 'A referral mechanism by which (our) 5 close contacts endorse to (their) 5 close contacts',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 48,
    'header' : '19. reputation & referrals',
    'title' : 'Please order the different stages of a referrals process:',
    'questions' : ['Boost your referability (namely through the 20LOG).','Target a network niche (a “barrel”, instead of open sea, where to congregate).','Upgrade your networking partners (e.g.: rely on growth oriented and credible platforms, in which you will discover advisors, affiliates, advocates, and allies).','Develop a referral culture (supported by processes and tools that consistently foster the coming and going of testimonials and referrals).','Create a reputation Scoring Board and make it visible to your market (including products and services reviews, certifications, testimonial, recommendations, and publications).','Convert your referrals into deals and deliver above expectations.','Repeat this cycle.',],
    'result' : ['Create a reputation Scoring Board and make it visible to your market (including products and services reviews, certifications, testimonial, recommendations, and publications).','Repeat this cycle.','Boost your referability (namely through the 20LOG).','Convert your referrals into deals and deliver above expectations.','Upgrade your networking partners (e.g.: rely on growth oriented and credible platforms, in which you will discover advisors, affiliates, advocates, and allies).','Target a network niche (a “barrel”, instead of open sea, where to congregate).','Develop a referral culture (supported by processes and tools that consistently foster the coming and going of testimonials and referrals).',],
    'answered' : ['Boost your referability (namely through the 20LOG).','Target a network niche (a “barrel”, instead of open sea, where to congregate).','Upgrade your networking partners (e.g.: rely on growth oriented and credible platforms, in which you will discover advisors, affiliates, advocates, and allies).','Develop a referral culture (supported by processes and tools that consistently foster the coming and going of testimonials and referrals).','Create a reputation Scoring Board and make it visible to your market (including products and services reviews, certifications, testimonial, recommendations, and publications).','Convert your referrals into deals and deliver above expectations.','Repeat this cycle.',],
    'type' : TypeQuestion.order,
  },
  {
    'id' : 49,
    'header' : '20. Brand Development',
    'title' : 'What metrics cannot be used to measure brand development?',
    'questions' : [
      'Knowledge (awareness, understanding, recall)','Positioning Understanding (by the different customer segments)','Age (for how many years a brand exists)','Contract Fulfilment (brands keep their promises)','Personality Recognition (not only the name, or the positioning, but also the values)','Design (the quality of design when compared to other brands)','Customer Acquisitions (brand based inbound sales)','Customer Retention and Loyalty (including churn metrics)','Penetration and Frequency (share-of-wallet due to brand based sales)','Value (price-premiums that brands can command).',
    ],
    'result' : 'Age (for how many years a brand exists)|Design (the quality of design when compared to other brands)|',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 50,
    'header' : '20. Brand Development',
    'title' : 'What is the sequence suggested by Miller to tell a story that positions a brand?',
    'questions' : ['A Character (the clients and their jobs to be done)…','Has a Problem (something that prevent clients to fulfil their needs)… ','And Meets a Guide (someone that can help them, like a Sherpa in the mountains)…','Who Gives Them a Plan (a guide who has a plan)…','And Calls Them to Action (direct: “buy now”; or transactional: promotions)…','That Helps Them to Avoid Failure (risk protection, guarantees)… ','And Ends in Success (tell clients how you can change their lives; do not assume that they know how to do it).',],
    'result' : ['And Meets a Guide (someone that can help them, like a Sherpa in the mountains)…','And Calls Them to Action (direct: “buy now”; or transactional: promotions)…','And Ends in Success (tell clients how you can change their lives; do not assume that they know how to do it).','That Helps Them to Avoid Failure (risk protection, guarantees)… ','A Character (the clients and their jobs to be done)…','Who Gives Them a Plan (a guide who has a plan)…','Has a Problem (something that prevent clients to fulfil their needs)… ',],
    'answered' : ['A Character (the clients and their jobs to be done)…','Has a Problem (something that prevent clients to fulfil their needs)… ','And Meets a Guide (someone that can help them, like a Sherpa in the mountains)…','Who Gives Them a Plan (a guide who has a plan)…','And Calls Them to Action (direct: “buy now”; or transactional: promotions)…','That Helps Them to Avoid Failure (risk protection, guarantees)… ','And Ends in Success (tell clients how you can change their lives; do not assume that they know how to do it).',],
    'type' : TypeQuestion.order,
  },
];

