const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const ticketsPageDisplayName = "Tickets";
const ticketsPageRoute = "/drivers";

const ideasPageDisplayName = "Ideas";
const ideasPageRoute = "/clients";

const contactsPageDisplayName = "Contacts";
const contactPageRoute = "/auth";

const agentsPageDisplayName = "Agents";
const agentPageRoute = "/auth";

const articlesPageDisplayName = "Articles";
const articlePageRoute = "/auth";

const settingsPageDisplayName = "Settings";
const settingsPageRoute = "/auth";

const subscriptionPageDisplayName = "Subscription";
const subscriptionPageRoute = "/auth";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(ticketsPageDisplayName, ticketsPageRoute),
  MenuItem(ideasPageDisplayName, ticketsPageRoute),
  MenuItem(contactsPageDisplayName, ticketsPageRoute),
  MenuItem(agentsPageDisplayName, ticketsPageRoute),
  MenuItem(articlesPageDisplayName, ticketsPageRoute),
  MenuItem(settingsPageDisplayName, ticketsPageRoute),
  MenuItem(subscriptionPageDisplayName, ticketsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
