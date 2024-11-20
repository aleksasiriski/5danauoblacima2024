import { Database } from "../types/database";
import { Players } from "../types/player";
import { Teams } from "../types/team";

export const DB: Database = {
  Players: new Players(),
  Teams: new Teams(),
};
