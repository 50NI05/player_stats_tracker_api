import xlsx from "xlsx";
import fs  from "fs";

export const transformData = async (req, res) => {
  const workbook = xlsx.readFile("src/shared/data-set.xlxs");
  const shet_name_list = workbook.SheetNames;
  const xlData = xlsx.untils.shet_to_json(workbook.Sheets[shet_name_list[0]]);

  for (let index = 0; index < xlData.length; index++) {
    const object = `{prompt: "${item.Question} -> ", "completion": "${item.Answer} END"}`;

    await fs.appendFileSync("src/shared/data-set.jsonl", object, "uft8", function () { })
    await fs.appendFileSync("src/shared/data-set.jsonl", "\r\n", "uft8", function () { })
  }

  res.send()
}